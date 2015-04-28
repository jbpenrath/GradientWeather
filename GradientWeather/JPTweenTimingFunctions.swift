//
//  TweenTimingFunctions.swift
//  GradientWeather
//
//  Created by jbpenrath on 27/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//
//  This is the swift adaptation of TweenTimingFunctions wrote by Sylvain Reucherand - https://github.com/sreucherand
//
//  --
//
//  TERMS OF USE - EASING EQUATIONS
//
//  Open source under the BSD License.
//
//  Copyright © 2001 Robert Penner
//  All rights reserved.
//


func JPTweenEaseLinear (time:Float, begin:Float, change:Float, duration:Float) -> Float {
    return change * time / duration + begin
}

func JPTweenEaseInBack (var t:Float , b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    t/=d
    return c*t*t*((s+1)*t - s) + b
}

func JPTweenEaseOutBack (var t:Float, b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    t/=d-1
    return c*(t*t*((s+1)*t + s) + 1) + b
}

func JPTweenEaseInOutBack (var t:Float, b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    if Float(t/=d/2) < 1 {
        s*=(1.525);
        return c/2*(t*t*((s+1)*t - s)) + b;
    }
    t-=2;
    s*=(1.525);
    return c/2*(t*t*((s+1)*t + s) + 2) + b;
}

func JPTweenEaseInBounce (t:Float, b:Float, c:Float, d:Float) -> Float {
    return c - TweenEaseOutBounce(d-t, 0, c, d) + b;
}

func JPTweenEaseOutBounce (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d) < (1/2.75) {
        return c*(7.5625*t*t) + b;
    } else if t < (2/2.75) {
        t-=(1.5/2.75);
        return c*(7.5625*t*t + 0.75) + b;
    } else if t < (2.5/2.75) {
        t-=(2.25/2.75);
        return c*(7.5625*t*t + 0.9375) + b;
    } else {
        t-=(2.625/2.75);
        return c*(7.5625*t*t + 0.984375) + b;
    }
}

func JPTweenEaseInOutBounce (t:Float, b:Float, c:Float, d:Float) -> Float {
    return t < d/2 ? TweenEaseInBounce(t*2, 0, c, d) * 0.5 + b : TweenEaseInBounce(t*2-d, 0, c, d) * 0.5 + c*0.5 + b
}

func JPTweenEaseInCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return -c * (sqrt(1 - t*t) - 1) + b;
}

func JPTweenEaseOutCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return c * sqrt(1 - t*t) + b;
}

func JPTweenEaseInOutCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return -c/2 * (sqrt(1 - t*t) - 1) + b; }
    t-=2;
    return c/2 * (sqrt(1 - t*t) + 1) + b;
}

func JPTweenEaseInCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return c*t*t*t + b;
}

func JPTweenEaseOutCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return c*(t*t*t + 1) + b;
}

func JPTweenEaseInOutCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return c/2*t*t*t + b; }
    t-=2;
    return c/2*(t*t*t + 2) + b;
}

func JPTweenEaseInElastic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    let p:Float = d*0.3;
    var s:Float, a:Float = 0.0;
    if t==0 { return b; }
    if Float(t/=d)==1 { return b+c; }
    if a != 0 || a < abs(c) { a=c; s=p/4; }
    else { s = p/Float(M_PI*2) * asin (c/a) }
    t-=1;
    return -(a*pow(2,10*t) * sin( (t*d-s)*Float(M_PI*2)/p )) + b;
}

func JPTweenEaseOutElastic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    let p:Float = d*0.3;
    var s:Float, a:Float = 0.0;
    if t==0 { return b; }
    if Float(t/=d)==1 { return b+c; }
    if !Bool(a) || a < abs(c) { a=c; s=p/4; }
    else { s = p/Float(M_PI*2) * asin (c/a); }
    return (a*pow(2,-10*t) * sin( (t*d-s)*Float(2*M_PI)/p ) + c + b);
}

func JPTweenEaseInOutElastic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    let p:Float = d*(0.3*1.5);
    var s:Float, a:Float = 0.0;
    if t==0 { return b; }
    if Float(t/=d/2)==2 { return b+c; }
    if a < abs(c) { a=c; s=p/4; }
    else { s = p/Float(2*M_PI) * asin (c/a); }
    if (t < 1) {
        t-=1;
        return -0.5*(a*pow(2,10*t) * sin( (t*d-s)*Float(2*M_PI)/p )) + b;
    }
    t-=1;
    return a*pow(2,-10*t) * sin( (t*d-s)*Float(2*M_PI)/p )*0.5 + c + b;
}

func JPTweenEaseInExpo (t:Float, b:Float, c:Float, d:Float) -> Float {
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}

func JPTweenEaseOutExpo (t:Float, b:Float, c:Float, d:Float) -> Float {
    return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
}

func JPTweenEaseInOutExpo (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if t==0 { return b; }
    if t==d { return b+c; }
    if Float(t/=d/2) < 1 { return c/2 * pow(2, 10 * (t - 1)) + b; }
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
}

func JPTweenEaseInQuad (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return c*t*t + b;
}

func JPTweenEaseOutQuad (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return -c*t*(t-2) + b;
}

func JPTweenEaseInOutQuad (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return c/2*t*t + b; }
    t--;
    return -c/2 * (t*(t-2) - 1) + b;
}

func JPTweenEaseInQuart (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return c*t*t*t*t + b;
}

func JPTweenEaseOutQuart (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return -c * (t*t*t*t - 1) + b;
}

func JPTweenEaseInOutQuart (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return c/2*t*t*t*t + b; }
    t-=2;
    return -c/2 * (t*t*t*t - 2) + b;
}

func JPTweenEaseInQuint (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return c*t*t*t*t*t + b;
}

func JPTweenEaseOutQuint (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return c*(t*t*t*t*t + 1) + b;
}

func JPTweenEaseInOutQuint (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return c/2*t*t*t*t*t + b; }
    t-=2;
    return c/2*(t*t*t*t*t + 2) + b;
}

func JPTweenEaseInSine (t:Float, b:Float, c:Float, d:Float) -> Float {
    return -c*cos(t/d*Float(M_PI/2))+c+b;
}

func JPTweenEaseOutSine (t:Float, b:Float, c:Float, d:Float) -> Float {
    return c*sin(t/d*Float(M_PI/2)) + b;
}

func JPTweenEaseInOutSine (t:Float, b:Float, c:Float, d:Float) -> Float {
    return -c/2*cos(Float(M_PI)*t/d)-1+b;
}
