//
//  CSTween.h
//  Tween
//
//  Created by Sylvain Reucherand on 30/12/2014.
//  Copyright (c) 2014 Sylvain Reucherand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CSTweenTimingFunctions.h"

typedef enum : NSUInteger {
    TweenEaseLinear,
    TweenEaseInBack,
    TweenEaseOutBack,
    TweenEaseInOutBack,
    TweenEaseInBounce,
    TweenEaseOutBounce,
    TweenEaseInOutBounce,
    TweenEaseInCirc,
    TweenEaseOutCirc,
    TweenEaseInOutCirc,
    TweenEaseInCubic,
    TweenEaseOutCubic,
    TweenEaseInOutCubic,
    TweenEaseInElastic,
    TweenEaseOutElastic,
    TweenEaseInOutElastic,
    TweenEaseInExpo,
    TweenEaseOutExpo,
    TweenEaseInOutExpo,
    TweenEaseInQuad,
    TweenEaseOutQuad,
    TweenEaseInOutQuad,
    TweenEaseInQuart,
    TweenEaseOutQuart,
    TweenEaseInOutQuart,
    TweenEaseInQuint,
    TweenEaseOutQuint,
    TweenEaseInOutQuint,
    TweenEaseInSine,
    TweenEaseOutSine,
    TweenEaseInOutSine
} TweenTimingFunctionName;


@class CSTweenOperation;

typedef CGFloat(*CSTweenTimingFunction)(CGFloat, CGFloat, CGFloat, CGFloat);

typedef void (^CSTweenUpdateBlock)(CSTweenOperation *operation);
typedef void (^CSTweenCompleteBlock)(BOOL finished);

@interface CSTweenOperation : NSObject

@property (nonatomic) CGFloat startValue;
@property (nonatomic) CGFloat endValue;
@property (nonatomic) CGFloat value;
@property (nonatomic) CGFloat duration;
@property (nonatomic) CGFloat delay;

@property (retain, nonatomic) NSObject *target;

@property (assign, nonatomic) CSTweenTimingFunction timingFunction;

@property (nonatomic) SEL updateSelector;
@property (nonatomic) SEL completeSelector;

@property(nonatomic, copy) CSTweenUpdateBlock updateBlock;
@property(nonatomic, copy) CSTweenCompleteBlock completeBlock;

@end

@interface CSTween : NSObject

+ (CSTween *)sharedInstance;

+ (CSTweenOperation *)tweenFrom:(CGFloat)from to:(CGFloat)to
                       duration:(CGFloat)duration
             timingFunctionName:(TweenTimingFunctionName)timingFunctionName
                    updateBlock:(CSTweenUpdateBlock)updateBlock
                  completeBlock:(CSTweenCompleteBlock)completeBlock;

+ (CSTweenOperation *)tweenFrom:(CGFloat)from
                             to:(CGFloat)to
                       duration:(CGFloat)duration
                          delay:(CGFloat)delay
             timingFunctionName:(TweenTimingFunctionName)timingFunctionName
                    updateBlock:(CSTweenUpdateBlock)updateBlock
                  completeBlock:(CSTweenCompleteBlock)completeBlock;

- (void)addTweenOperation:(CSTweenOperation *)operation;
- (void)removeTweenOperation:(CSTweenOperation *)operation;
- (void)removeAllTweenOperations;

@end
