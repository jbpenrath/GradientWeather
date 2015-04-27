//
//  TweenTimingFunctions.swift
//  GradientWeather
//
//  Created by jbpenrath on 27/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//
//  This is the swift adaptation of CSTweenTimingFunctions wrote by Sylvain Reucherand - https://github.com/sreucherand
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


func CSTweenEaseLinear (time:Float, begin:Float, change:Float, duration:Float) -> Float {
    return change * time / duration + begin
}

func CSTweenEaseInBack (var t:Float , b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    t/=d
    return c*t*t*((s+1)*t - s) + b
}

func CSTweenEaseOutBack (var t:Float, b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    t/=d-1
    return c*(t*t*((s+1)*t + s) + 1) + b
}

func CSTweenEaseInOutBack (var t:Float, b:Float, c:Float, d:Float) -> Float {
    var s:Float = 1.70158
    if Float(t/=d/2) < 1 {
        s*=(1.525);
        return c/2*(t*t*((s+1)*t - s)) + b;
    }
    t-=2;
    s*=(1.525);
    return c/2*(t*t*((s+1)*t + s) + 2) + b;
}

func CSTweenEaseInBounce (t:Float, b:Float, c:Float, d:Float) -> Float {
    return c - CSTweenEaseOutBounce(d-t, 0, c, d) + b;
}

func CSTweenEaseOutBounce (var t:Float, b:Float, c:Float, d:Float) -> Float {
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

func CSTweenEaseInOutBounce (t:Float, b:Float, c:Float, d:Float) -> Float {
    return t < d/2 ? CSTweenEaseInBounce(t*2, 0, c, d) * 0.5 + b : CSTweenEaseInBounce(t*2-d, 0, c, d) * 0.5 + c*0.5 + b
}

func CSTweenEaseInCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return -c * (sqrt(1 - t*t) - 1) + b;
}

func CSTweenEaseOutCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return c * sqrt(1 - t*t) + b;
}

func CSTweenEaseInOutCirc (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return -c/2 * (sqrt(1 - t*t) - 1) + b; }
    t-=2;
    return c/2 * (sqrt(1 - t*t) + 1) + b;
}

func CSTweenEaseInCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t/=d;
    return c*t*t*t + b;
}

func CSTweenEaseOutCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    t=t/d-1;
    return c*(t*t*t + 1) + b;
}

func CSTweenEaseInOutCubic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    if Float(t/=d/2) < 1 { return c/2*t*t*t + b; }
    t-=2;
    return c/2*(t*t*t + 2) + b;
}

func CSTweenEaseInElastic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    let p:Float = d*0.3;
    var s:Float, a:Float = 0.0;
    if t==0 { return b; }
    if Float(t/=d)==1 { return b+c; }
    if a != 0 || a < abs(c) { a=c; s=p/4; }
    else { s = p/Float(M_PI*2) * asin (c/a) }
    t-=1;
    return -(a*pow(2,10*t) * sin( (t*d-s)*Float(M_PI*2)/p )) + b;
}

func CSTweenEaseOutElastic (var t:Float, b:Float, c:Float, d:Float) -> Float {
    let p:Float = d*0.3;
    var s:Float, a:Float = 0.0;
    if t==0 { return b; }
    if Float(t/=d)==1 { return b+c; }
    if !Bool(a) || a < abs(c) { a=c; s=p/4; }
    else { s = p/Float(M_PI*2) * asin (c/a); }
    return (a*pow(2,-10*t) * sin( (t*d-s)*Float(2*M_PI)/p ) + c + b);
}

CGFloat CSTweenEaseInOutElastic (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat p = d*(.3*1.5);
    CGFloat s, a = .0;
    if (t==0) return b;  if ((t/=d/2)==2) return b+c;
    if (!a || a < ABS(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    if (t < 1) {
        t-=1;
        return -.5*(a*pow(2,10*t) * sin( (t*d-s)*(2*M_PI)/p )) + b;
    }
    t-=1;
    return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}

CGFloat CSTweenEaseInExpo (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}
CGFloat CSTweenEaseOutExpo (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
}
CGFloat CSTweenEaseInOutExpo (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
}

CGFloat CSTweenEaseInQuad (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t/=d;
    return c*t*t + b;
}
CGFloat CSTweenEaseOutQuad (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t/=d;
    return -c *t*(t-2) + b;
}
CGFloat CSTweenEaseInOutQuad (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t/=d/2) < 1) return c/2*t*t + b;
    t--;
    return -c/2 * (t*(t-2) - 1) + b;
}

CGFloat CSTweenEaseInQuart (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t/=d;
    return c*t*t*t*t + b;
}
CGFloat CSTweenEaseOutQuart (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t=t/d-1;
    return -c * (t*t*t*t - 1) + b;
}
CGFloat CSTweenEaseInOutQuart (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
    t-=2;
    return -c/2 * (t*t*t*t - 2) + b;
}

CGFloat CSTweenEaseInQuint (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t/=d;
    return c*t*t*t*t*t + b;
}
CGFloat CSTweenEaseOutQuint (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t=t/d-1;
    return c*(t*t*t*t*t + 1) + b;
}
CGFloat CSTweenEaseInOutQuint (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
    t-=2;
    return c/2*(t*t*t*t*t + 2) + b;
}

CGFloat CSTweenEaseInSine (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c * cos(t/d * (M_PI/2)) + c + b;
}
CGFloat CSTweenEaseOutSine (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c * sin(t/d * (M_PI/2)) + b;
}
CGFloat CSTweenEaseInOutSine (CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c/2 * (cos(M_PI*t/d) - 1) + b;
}
