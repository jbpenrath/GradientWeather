//
//  Cloud.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 08/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Cloud:UIView {
    var cloud = UIView()
    var circle1 = CAGradientLayer()
    var circle2 = CAGradientLayer()
    var circle3 = CAGradientLayer()
    
    let circleDiameter:CGFloat = 60.0
    var direction:Bool!
    
    override init(frame:CGRect) {
        super.init(frame: frame);
        self.frame = frame
        cloud.frame = CGRect(origin: CGPointZero, size: CGSize(width: 144, height: 45))
        cloud.center.y = self.frame.height/2
        
        if arc4random_uniform(2) == 0 {
            direction = false
            cloud.center.x = -cloud.frame.width
        } else {
            direction = true
            cloud.center.x = self.frame.width + cloud.frame.width
        }
        
        setGradients()
        setAnimation()
    }
    
    func setGradients() {
        // Create Circle Mask
        let path = UIBezierPath(arcCenter: CGPoint(x: circleDiameter/2, y: circleDiameter/2), radius: circleDiameter/2, startAngle: 0, endAngle: CGFloat(M_PI), clockwise: false)
        
        let circle1MaskLayer = CAShapeLayer()
        circle1MaskLayer.path = path.CGPath
        let circle2MaskLayer = CAShapeLayer()
        circle2MaskLayer.path = path.CGPath
        let circle3MaskLayer = CAShapeLayer()
        circle3MaskLayer.path = path.CGPath
        
        let colors:[CGColor] = [UIColor(white: 1, alpha: 0.25).CGColor, UIColor.whiteColor().CGColor, UIColor.whiteColor().CGColor]
        let locations = [0, 0.85, 1]
        
        // Circle1 - Left
        circle1.bounds = CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter/2)
        circle1.masksToBounds = true;
        circle1.anchorPoint = CGPoint(x: 1, y: 1)
        circle1.position = CGPoint(x: circleDiameter, y: cloud.frame.height)
        circle1.mask = circle1MaskLayer
        circle1.colors = colors
        circle1.locations = locations
        circle1.opacity = 0.85
    
        // Circle2 - Middle
        circle2.bounds = CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter/2)
        circle2.masksToBounds = true;
        circle2.anchorPoint = CGPoint(x: 1, y: 1)
        circle2.position = CGPoint(x: circleDiameter*2, y: cloud.frame.height)
        circle2.mask = circle2MaskLayer
        circle2.colors = colors
        circle2.locations = locations
        circle2.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        circle2.opacity = 0.9
        
        // Circle3 - Right
        circle3.bounds = CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter/2)
        circle3.masksToBounds = true;
        circle3.anchorPoint = CGPoint(x: 1, y: 1)
        circle3.position = CGPoint(x: circleDiameter*2.4, y: cloud.frame.height)
        circle3.mask = circle3MaskLayer
        circle3.colors = colors
        circle3.locations = locations
        circle3.transform = CATransform3DMakeScale(0.8, 0.8, 0)
        circle3.opacity = 0.85
        
        cloud.layer.insertSublayer(circle1, atIndex: 0)
        cloud.layer.insertSublayer(circle2, below: circle1)
        cloud.layer.insertSublayer(circle3, atIndex: 0)
        
        cloud.alpha = CGFloat(0.5 + 0.5 * Float(arc4random()) / Float(UINT32_MAX))
        let scale = CGFloat(0.5 + 0.5 * Float(arc4random()) / Float(UINT32_MAX))
        cloud.transform = CGAffineTransformMakeScale(scale, scale)
        self.addSubview(cloud)
        
    }
    
    func setAnimation() {
        let horizontalMovement = CABasicAnimation(keyPath: "position.x")
        
        if (direction==true) { horizontalMovement.toValue = -cloud.bounds.width }
        else { horizontalMovement.toValue = self.frame.width + cloud.bounds.width }
        
        horizontalMovement.duration = CFTimeInterval(20 + 20 * Float(arc4random()) / Float(UINT32_MAX))
        horizontalMovement.autoreverses = true
        horizontalMovement.repeatCount = Float.infinity
        
        cloud.layer.addAnimation(horizontalMovement, forKey:"Move")
        
    }
    
    // Bullshit
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
