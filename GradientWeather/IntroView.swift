//
//  IntroView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class IntroView:UIView {
    
    let NameLabel:UILabel = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let screenBounds = UIScreen.mainScreen().bounds
        
//        self.transform = CGAffineTransformMakeScale(0.3, 0.3)

        println(self.center)
        
        let circle = CAShapeLayer()
        circle.frame = CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height)
        circle.path = UIBezierPath(ovalInRect: circle.frame).CGPath
        circle.fillColor = UIColor(red:0.99, green:0.31, blue:0.32, alpha:1).CGColor
        layer.addSublayer(circle)
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.fromValue = 1
        animationScale.toValue = 40/circle.frame.height
        
        let keepCenter = CABasicAnimation(keyPath: "position")
        keepCenter.fromValue = NSValue(CGPoint: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2))
        keepCenter.toValue = NSValue(CGPoint: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2))
        
        let group = CAAnimationGroup()
        group.animations = [animationScale, keepCenter]
        group.duration = 2
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        group.fillMode = kCAFillModeForwards
        group.removedOnCompletion = false
        
        NameLabel.text = "Pauline"
        NameLabel.font = UIFont(name: "National-Bold", size: 24)
        NameLabel.textColor = UIColor(red:0.99, green:0.31, blue:0.32, alpha:1)
        NameLabel.textAlignment = NSTextAlignment.Center
        NameLabel.sizeToFit()
        NameLabel.center = CGPoint(x: self.bounds.width/2, y: 40+self.bounds.height/2)
        NameLabel.alpha = 0
        
        self.addSubview(NameLabel)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            let videoView:VideoView = VideoView(frame: self.frame)
            self.addSubview(videoView)
            println("Prout")
        }
        circle.addAnimation(group, forKey: "kiki")
        CATransaction.commit()
        
    }
    
}