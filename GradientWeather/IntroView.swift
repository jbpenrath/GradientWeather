//
//  IntroView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class IntroView:UIView {
    
    let circle = CAShapeLayer()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let bounds = UIScreen.mainScreen().bounds
    
        circle.bounds = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
        circle.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
        circle.path = UIBezierPath(ovalInRect: circle.bounds).CGPath
        circle.fillColor = UIColor(red:1, green:0.243, blue:0.337, alpha:1).CGColor
        circle.zPosition = -1
        
        println(circle.frame)
        println(circle.position)
        
        layer.addSublayer(circle)
        
    }
    
    func launchAnimation() {
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.fromValue = 1
        animationScale.toValue = 40/circle.frame.height
        animationScale.duration = 1.5
        animationScale.fillMode = kCAFillModeForwards
        animationScale.removedOnCompletion = false
        
        
        circle.addAnimation(animationScale, forKey: "circleScalingDown")
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        println(self.frame)
        
    }
    
}