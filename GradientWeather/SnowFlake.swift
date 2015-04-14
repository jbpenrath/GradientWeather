//
//  SnowFlake.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 11/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class SnowFlake: CAShapeLayer {
    
    init(frame: CGRect!) {
        super.init()
        
        self.frame = frame
        
        setShape()
        setAnimations()
        
    }

    func setShape() {
        let shapePath:UIBezierPath = UIBezierPath(ovalInRect: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: 20, height: 20))
        self.path = shapePath.CGPath
        self.fillColor = UIColor(white: 1, alpha: 0.7).CGColor
    }
    
    func setAnimations() {
        
        
        let verticalMovement = CABasicAnimation(keyPath: "position.y")
        verticalMovement.toValue = self.frame.height/2 + CGFloat(arc4random_uniform(UInt32(self.frame.height)))
        verticalMovement.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        verticalMovement.duration = 3
        
        let horizontalMovement = CAKeyframeAnimation(keyPath: "position.x")
        
//        for(var i:CGFloat; i<CGFloat(verticalMovement); i+=CGFloat(verticalMovement)/0.1) {
//            hori
//        }
        
        horizontalMovement.duration = verticalMovement.duration
        
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.toValue = 0
        fadeOut.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        fadeOut.duration = 0.25
        fadeOut.beginTime = verticalMovement.duration
        
        let AnimationGroup = CAAnimationGroup()
        AnimationGroup.animations = [verticalMovement, horizontalMovement, fadeOut]
        AnimationGroup.duration = verticalMovement.duration
        AnimationGroup.repeatCount = Float.infinity
        
        self.addAnimation(AnimationGroup, forKey: "SnowIsFalling")
        
    }
    
    // Bullshit
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}