//
//  CSTween.m
//  Tween
//
//  Created by Sylvain Reucherand on 30/12/2014.
//  Copyright (c) 2014 Sylvain Reucherand. All rights reserved.
//
//  Freely inspired from https://github.com/PRTween/PRTween
//

#import "CSTween.h"

#define kCSTweenFramerate 1.0/60

static CSTween *instance = nil;

@interface CSTweenOperation ()

@property (nonatomic) CGFloat startTime;

@end

@implementation CSTweenOperation

@end

@interface CSTween ()

@property (assign, nonatomic) CGFloat time;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableArray *operations;
@property (strong, nonatomic) NSMutableArray *expiredOperations;
@property (strong, nonatomic) NSMutableDictionary *tweenTimingFunctions;

@end

@implementation CSTween {
    CSTweenTimingFunction defaultTimingFunction;
}

#pragma mark - Initialization

+ (CSTween *)sharedInstance {
    if (nil == instance) {
        instance = [[self alloc] initPrivate];
    }
    
    return instance;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Preferred use methode +sharedInstance"
                                 userInfo:nil];
    
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        self.operations = [[NSMutableArray alloc] init];
        self.expiredOperations = [[NSMutableArray alloc] init];
        self.tweenTimingFunctions = [[NSDictionary alloc] init];
        defaultTimingFunction = &CSTweenEaseLinear;
    }
    
    return self;
}

#pragma mark - Dealloc

- (void)dealloc {
    [self.timer invalidate];
    
    self.timer = nil;
}

#pragma mark - Tween class methods

+ (CSTweenOperation *)tweenFrom:(CGFloat)from
                             to:(CGFloat)to
                       duration:(CGFloat)duration
             timingFunctionName:(TweenTimingFunctionName)timingFunctionName
                    updateBlock:(CSTweenUpdateBlock)updateBlock
                  completeBlock:(CSTweenCompleteBlock)completeBlock {
    return [CSTween tweenFrom:from to:to duration:duration delay:0 timingFunctionName:timingFunctionName updateBlock:updateBlock completeBlock:completeBlock];
}

+ (CSTweenOperation *)tweenFrom:(CGFloat)from
                             to:(CGFloat)to
                       duration:(CGFloat)duration
                          delay:(CGFloat)delay
             timingFunctionName:(TweenTimingFunctionName)timingFunctionName
                    updateBlock:(CSTweenUpdateBlock)updateBlock
                  completeBlock:(CSTweenCompleteBlock)completeBlock {
    CSTweenOperation *operation = [[CSTweenOperation alloc] init];
    
    operation.startValue = from;
    operation.endValue = to;
    operation.duration = duration;
    operation.delay = delay;
    operation.timingFunction = [self getTimingFunction:timingFunctionName];
    operation.updateBlock = updateBlock;
    operation.completeBlock = completeBlock;
    
    [[CSTween sharedInstance] performSelector:@selector(addTweenOperation:) withObject:operation afterDelay:0 inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    
    return operation;
}

+ (CSTweenTimingFunction)getTimingFunction:(TweenTimingFunctionName)functionName {
    switch (functionName) {
        case TweenEaseLinear:
            return CSTweenEaseLinear;
            break;
        case TweenEaseInBack:
            return CSTweenEaseInBack;
            break;
        case TweenEaseOutBack:
            return CSTweenEaseOutBack;
            break;
        case TweenEaseInOutBack:
            return CSTweenEaseInOutBack;
            break;
        case TweenEaseInBounce:
            return CSTweenEaseInBounce;
            break;
        case TweenEaseOutBounce:
            return CSTweenEaseOutBounce;
            break;
        case TweenEaseInOutBounce:
            return CSTweenEaseInOutBounce;
            break;
        case TweenEaseInCirc:
            return CSTweenEaseInCirc;
            break;
        case TweenEaseOutCirc:
            return CSTweenEaseOutCirc;
            break;
        case TweenEaseInOutCirc:
            return CSTweenEaseInOutCirc;
            break;
        case TweenEaseInCubic:
            return CSTweenEaseInCubic;
            break;
        case TweenEaseOutCubic:
            return CSTweenEaseOutCubic;
            break;
        case TweenEaseInOutCubic:
            return CSTweenEaseInOutCubic;
            break;
        case TweenEaseInElastic:
            return CSTweenEaseInElastic;
            break;
        case TweenEaseOutElastic:
            return CSTweenEaseOutElastic;
            break;
        case TweenEaseInOutElastic:
            return CSTweenEaseInOutElastic;
            break;
        case TweenEaseInExpo:
            return CSTweenEaseInExpo;
            break;
        case TweenEaseOutExpo:
            return CSTweenEaseOutExpo;
            break;
        case TweenEaseInOutExpo:
            return CSTweenEaseInOutExpo;
            break;
        case TweenEaseInQuad:
            return CSTweenEaseInQuad;
            break;
        case TweenEaseOutQuad:
            return CSTweenEaseOutQuad;
            break;
        case TweenEaseInOutQuad:
            return CSTweenEaseInOutQuad;
            break;
        case TweenEaseInQuart:
            return CSTweenEaseInQuart;
            break;
        case TweenEaseOutQuart:
            return CSTweenEaseOutQuart;
            break;
        case TweenEaseInOutQuart:
            return CSTweenEaseInOutQuart;
            break;
        case TweenEaseInQuint:
            return CSTweenEaseInQuint;
            break;
        case TweenEaseOutQuint:
            return CSTweenEaseOutQuint;
            break;
        case TweenEaseInOutQuint:
            return CSTweenEaseInOutQuint;
            break;
        case TweenEaseInSine:
            return CSTweenEaseInSine;
            break;
        case TweenEaseOutSine:
            return CSTweenEaseOutSine;
            break;
        case TweenEaseInOutSine:
            return CSTweenEaseInOutSine;
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - Get time

- (CGFloat)time {
    if (0 == _time) {
        _time = CACurrentMediaTime();
    }
    
    return _time;
}

#pragma mark - Engine actions

- (void)start {
    if (nil == self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kCSTweenFramerate
                                                      target:self
                                                    selector:@selector(update)
                                                    userInfo:nil
                                                     repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {
    [self.timer invalidate];
    
    self.timer = nil;
    self.time = 0;
}

- (void)update {
    self.time += kCSTweenFramerate;
    
    if (0 == [self.operations count]) {
        [self stop];
    }
    
    for (__strong CSTweenOperation *operation in self.operations) {
        if ([self.expiredOperations containsObject:operation]) {
            continue;
        }
        
        if (self.time <= operation.startTime + operation.delay) {
            continue;
        }
        
        if (self.time > operation.startTime + operation.delay + operation.duration) {
            operation.value = operation.endValue;
        
            [self.expiredOperations addObject:operation];
        } else {
            operation.value = operation.timingFunction(self.time - operation.delay - operation.startTime, operation.startValue, operation.endValue - operation.startValue, operation.duration);
        }
    
        if (operation.updateBlock) {
            operation.updateBlock(operation);
        }
        
        if (operation.updateSelector) {
            [operation.target performSelector:operation.updateSelector withObject:operation afterDelay:0 inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
        }
    }
    
    for (__strong CSTweenOperation *operation in self.expiredOperations) {
        BOOL finished = operation.value == operation.endValue;
        
        if (operation.completeBlock) {
            operation.completeBlock(finished);
        }
        
        if (operation.completeSelector) {
            [operation.target performSelector:operation.completeSelector withObject:nil afterDelay:0 inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
        }
        
        [self.operations removeObject:operation];
    }
    
    [self.expiredOperations removeAllObjects];
}

#pragma mark - Operations managment

- (void)addTweenOperation:(CSTweenOperation *)operation {
    if (nil != operation) {
        if (![self.operations containsObject:operation]) {
            operation.startTime = self.time;
            
            if (NULL == operation.timingFunction) {
                operation.timingFunction = defaultTimingFunction;
            }
            
            [self.operations addObject:operation];
            
            [self start];
        }
    }
}

- (void)removeTweenOperation:(CSTweenOperation *)operation {
    if (nil != operation) {
        if ([self.operations containsObject:operation]) {
            [self.expiredOperations addObject:operation];
        }
    }
}

- (void)removeAllTweenOperations {
    for (CSTweenOperation *operation in self.operations) {
        [self removeTweenOperation:operation];
    }
}

@end
