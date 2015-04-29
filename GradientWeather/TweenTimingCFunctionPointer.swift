//
//  TweenCFunctionPointer.swift
//  GradientWeather
//
//  Created by jbpenrath on 29/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

struct TweenTimingCFunctionPointer {
    
    let cPointer:COpaquePointer
    let functionPointer:CFunctionPointer<((Double, Double, Double, Double) -> Double)>
    
    init(tweenTiming:((Double, Double, Double, Double)->Double)) {
        let pointer = UnsafeMutablePointer<((Double, Double, Double, Double) -> Double)>.alloc(1)
        pointer.initialize(tweenTiming)
        cPointer = COpaquePointer(pointer)
        functionPointer = CFunctionPointer<((Double, Double, Double, Double) -> Double)>(cPointer)
    }
}

let TweenEaseLinear = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseLinear).functionPointer

let TweenEaseInBack = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInBack).functionPointer
let TweenEaseOutBack = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutBack).functionPointer
let TweenEaseInOutBak = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutBack).functionPointer

let TweenEaseInBounce = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInBounce).functionPointer
let TweenEaseOutBounce = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutBounce).functionPointer
let TweenEaseInOutBounce = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutBounce).functionPointer

let TweenEaseInCirc = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInCirc).functionPointer
let TweenEaseOutCirc = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutCirc).functionPointer
let TweenEaseInOutCirc = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutCirc).functionPointer

let TweenEaseInCubic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInCubic).functionPointer
let TweenEaseOutCubic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutCubic).functionPointer
let TweenEaseInOutCubic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutCubic).functionPointer

let TweenEaseInElastic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInElastic).functionPointer
let TweenEaseOutElastic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutElastic).functionPointer
let TweenEaseInOutElastic = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutElastic).functionPointer

let TweenEaseInExpo = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInExpo).functionPointer
let TweenEaseOutExpo = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutExpo).functionPointer
let TweenEaseInOutExpo = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutExpo).functionPointer

let TweenEaseInQuad = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInQuad).functionPointer
let TweenEaseOutQuad = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutQuad).functionPointer
let TweenEaseInOutQuad = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutQuad).functionPointer

let TweenEaseInQuart = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInQuart).functionPointer
let TweenEaseOutQuart = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutQuart).functionPointer
let TweenEaseInOutQuart = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutQuart).functionPointer

let TweenEaseInQuint = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInQuint).functionPointer
let TweenEaseOutQuint = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutQuint).functionPointer
let TweenEaseInOutQuint = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutQuint).functionPointer

let TweenEaseInSine = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInSine).functionPointer
let TweenEaseOutSine = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseOutSine).functionPointer
let TweenEaseInOutSine = TweenTimingCFunctionPointer(tweenTiming: CSTweenEaseInOutSine).functionPointer