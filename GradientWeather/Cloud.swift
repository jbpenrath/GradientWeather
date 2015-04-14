//
//  Cloud.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 08/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Cloud:CALayer {
    var circle1 = CAGradientLayer()
    var circle2 = CAGradientLayer()
    var circle3 = CAGradientLayer()
    
    let circleDiameter:CGFloat = 60.0
    var direction:Bool!
    
    init(frame:CGRect) {
        super.init();
        
        self.frame = frame
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position.x = CGFloat(arc4random_uniform(UInt32(self.frame.width)))
        
        self.opacity = 0.75
        
        if Int(0.5+Float(arc4random()) / Float(UINT32_MAX)) == Int(0) { direction = false }
        else { direction = true }
        
            setGradients()
        setMask()
        setAnimation()
    }
    
    func setGradients() {
        // Create Circle Mask
        let path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter))
        
        let circle1MaskLayer = CAShapeLayer()
        circle1MaskLayer.path = path.CGPath
        let circle2MaskLayer = CAShapeLayer()
        circle2MaskLayer.path = path.CGPath
        let circle3MaskLayer = CAShapeLayer()
        circle3MaskLayer.path = path.CGPath
        
        let colors:[CGColor] = [UIColor.whiteColor().CGColor, UIColor(white: 1, alpha: 0.85).CGColor]
        
        // Circle1 - Left
        circle1.frame = CGRect(x: 0, y: 15, width: circleDiameter, height: circleDiameter)
        circle1.mask = circle1MaskLayer
        circle1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle1.colors = colors
    
        // Circle2 - Middle
        circle2.frame = CGRect(x: 45, y: 15, width: circleDiameter, height: circleDiameter)
        circle2.mask = circle2MaskLayer
        circle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle2.colors = colors
        circle2.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        
        // Circle3 - Right
        circle3.frame = CGRect(x: 90, y: 15, width: circleDiameter, height: circleDiameter)
        circle3.mask = circle3MaskLayer
        circle3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle3.colors = colors
        
        self.insertSublayer(circle1, atIndex: 0)
        self.insertSublayer(circle2, below: circle1)
        self.insertSublayer(circle3, atIndex: 0)
        
    }
    
    func setMask() {
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        
        self.mask = mask;
        
    }
    
    func setAnimation() {
        let horizontalMovement = CABasicAnimation(keyPath: "position.x")
        horizontalMovement.toValue = self.frame.width
        
        if (direction==true) { horizontalMovement.toValue = self.frame.width }
        else { horizontalMovement.toValue = 0 }
        
        horizontalMovement.duration = CFTimeInterval(20 + 20 * Float(arc4random()) / Float(UINT32_MAX))
        horizontalMovement.autoreverses = true
        horizontalMovement.repeatCount = Float.infinity
        
        self.addAnimation(horizontalMovement, forKey:"Move")
        
    }
    
    // Bullshit
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
