//
//  JPTween.swift
//  GradientWeather
//
//  Created by jbpenrath on 27/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//
//  This is the swift adaptation of CSTween wrote by Sylvain Reucherand - https://github.com/sreucherand
//

import UIKit

typealias JPTweenTimingFunction = (Float, Float, Float, Float) -> Float
typealias JPTweenUpdateBlock = JPTweenOperation -> Void
typealias JPTweenCompleteBlock = Bool -> Void


let kJPTweenFramerate:Float! = 1.0/60
var instance:JPTween? = nil
var startTime:Float!

//MARK - JPTweenOperation
class JPTweenOperation {
    
    var startValue: Float!
    var endValue: Float!
    var value: Float!
    var duration: Float!
    var delay: Float!
    var startTime:Float!
    
    var target: NSObject!
    var timingFunction: JPTweenTimingFunction!
    var updateSelector: Selector!
    var completeSelector: Selector!
    
    var updateBlock:JPTweenUpdateBlock!
    var completeBlock:JPTweenCompleteBlock!
    
}

//MARK - Tween
class JPTween {
    
    static let sharedInstance = JPTween()
    
    var time:Float!
    var timer:NSTimer!
    var operations:NSMutableArray!
    var expiredOperations:NSMutableArray!
    let defaultTimingFunction: JPTweenTimingFunction!
    
    init() {
        
        self.operations = []
        self.expiredOperations = []
        
        defaultTimingFunction = JPTweenEaseLinear
        
    }
    
    //MARK - Perform Selector
    func callSelectorAsync(selector: Selector, object: AnyObject?, delay: NSTimeInterval) -> NSTimer {
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: selector, userInfo: object, repeats: false)
        return timer
    }
    
    func callSelector(selector: Selector, object: AnyObject?, delay: NSTimeInterval) {
        
        let delay = delay * Double(NSEC_PER_SEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            NSThread.detachNewThreadSelector(selector, toTarget:self, withObject: object)
        })
    }
    
    //MARK - Dealloc
    func dealloc() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    //MARK - Tween class methods
    func tweenFrom(from:Float, to:Float, duration:Float, delay:Float = 0.0, timingFunction:JPTweenTimingFunction, updateBlock:JPTweenUpdateBlock, completeBlock:JPTweenCompleteBlock) -> JPTweenOperation {
        
        let operation:JPTweenOperation = JPTweenOperation()
        operation.startValue = from
        operation.endValue = to
        operation.duration = duration
        operation.delay = delay
        operation.timingFunction = timingFunction
        operation.updateBlock = updateBlock
        operation.completeBlock = completeBlock
        
        JPTween.sharedInstance.callSelector(Selector("addTweenOperation"), object: operation, delay: 0)
        
        return operation
    }
    
    //MARK - Get time
    func getTime() -> Float {
        if 0 == self.time {
            self.time = Float(CACurrentMediaTime())
        }
        
        return self.time
        
    }
    
    //MARK - Engine actions
    func start() {
        if nil == self.timer {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(kJPTweenFramerate), target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            NSRunLoop.mainRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
        }
    }
    
    func stop() {
        self.timer.invalidate()
        self.timer = nil
        self.time = 0
    }
    
    func update() {
        self.time = self.time + kJPTweenFramerate
        
        if 0 == self.operations.count {
            self.stop()
        }
        
        for operation in self.operations {
            
            let operation = operation as! JPTweenOperation
            
            if self.expiredOperations.containsObject(operation) {
                continue
            }
            
            if self.time <= operation.startTime + operation.delay + operation.duration {
                operation.value = operation.endValue
                self.expiredOperations.addObject(operation)
            } else {
                operation.value = operation.timingFunction(self.time - operation.delay - operation.startTime, operation.startValue, operation.endValue - operation.startValue, operation.duration)
            }
            
            if((operation.updateBlock) != nil) {
                operation.updateBlock(operation)
            }
            
            if((operation.updateSelector) != nil) {
                self.callSelector(operation.updateSelector, object: operation, delay: 0)
            }
            
        }
        
        for operation in self.operations {
            let operation = operation as! JPTweenOperation
            
            let finished:Bool = operation.value == operation.endValue
            
            if((operation.completeBlock) != nil) {
                operation.completeBlock(finished)
            }
            
            if((operation.completeSelector) != nil) {
                self.callSelector(operation.completeSelector, object: nil, delay: 0)
            }
            
            self.operations.removeObject(operation)
            
        }
        
        self.expiredOperations.removeAllObjects()
        
    }
    
    //MARK - Operations Management
    func addTweenOperation(operation:JPTweenOperation!) {
        
        println("Tweening")
        
        if nil != operation {
            
            if self.operations.containsObject(operation) {
                operation.startTime = self.time
                
                if nil == operation.timingFunction {
                    operation.timingFunction = defaultTimingFunction
                }
                
                self.operations.addObject(operation)
                
                self.start()
                
            }
        }
    }
    
    func removeTweenOperation(operation:JPTweenOperation!) {
        if nil != operation {
            if self.operations.containsObject(operation) {
                self.expiredOperations.addObject(operation)
            }
        }
    }
    
    func removeAllTweenOperations() {
        for operation in self.operations {
            self.removeTweenOperation(operation as! JPTweenOperation)
        }
        
    }
    
}