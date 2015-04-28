//
//  JPTween.swift
//  GradientWeather
//
//  Created by jbpenrath on 27/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//
//  This is the swift adaptation of CSTween wrote by Sylvain Reucherand - https://github.com/sreucherand
//

import Foundation

typealias JPTweenTimingFunction = (Float, Float, Float, Float) -> Float
typealias JPTweenUpdateBlock = JPTweenOperation -> Void
typealias JPTweenCompleteBlock = Bool -> Void


let kJPTweenFramerate = 1.0/60
var instance:JPTween? = nil
var startTime:Float!

//MARK - JPTweenOperation
class JPTweenOperation {
    
    var startValue: Float!
    var endValue: Float!
    var value: Float!
    var duration: Float!
    var delay: Float!
    
    var target: NSObject!
    var timingFunction: JPTweenTimingFunction!
    var updateSelector: Selector!
    var completeSelector: Selector!
    
}

//MARK - Tween
class JPTween {
    
    var time:Float!
    var timer:NSTimer!
    var operations:Array<JPTweenOperation>!
    var expiredOperations:Array<JPTweenOperation>!
    let defaultTimingFunction: JPTweenTimingFunction!
    
    init() {
        self.
    }
    
    func sharedInstance() -> JPTween {
        if nil == instance {
            instance = self.init()
        }
        
        return instance
    }
    
    
    func init() -> JPTween {
        self = super.init()
        
        if(self) {
            self.operations = []
            self.expiredOperations = []
            
            defaultTimingFunction = JPTweenEaseLinear
            
        }
        
        return self
    }
    
}