//
//  Blow.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 17/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Blow: CAGradientLayer {
    
    //    var dropGradientLayer:CAGradientLayer!
    var dropFallAnimation:CABasicAnimation!
    var dropDisappearanceAnimation:CABasicAnimation!
    var masterAnimation:CAAnimationGroup!
    var distance:CGFloat = 0.0
    var widthOfSuperLayer:CGFloat = 0.0
    let velocity:CGFloat = 4/1000
    var direction:Bool?
    
    init(frame: CGRect) {
        super.init();
        self.bounds = frame
        self.widthOfSuperLayer = self.frame.width
        self.bounds.size = CGSize(width: CGFloat(175+arc4random_uniform(100)), height: self.frame.height)
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.opacity = 0.5+(Float(arc4random()) / Float(UINT32_MAX))*0.5
        
        if arc4random_uniform(2) == 0 {
            self.direction = true
            self.position.x = -(self.bounds.width + CGFloat(arc4random_uniform(UInt32(self.widthOfSuperLayer))))
        } else {
            self.direction = false
            self.position.x = self.widthOfSuperLayer + CGFloat(arc4random_uniform(UInt32(self.widthOfSuperLayer)))
        }
        
        setGradient()
        setAnimation()
        
    }
    
    func setGradient() {
        self.colors = [UIColor(white: 1, alpha: 0).CGColor, UIColor(white: 1.0, alpha: 0.9).CGColor, UIColor(white: 1, alpha: 0).CGColor]
        self.locations = [0, 0.7, 1]
        self.startPoint = CGPoint(x: 0, y: 0.5)
        self.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    func setAnimation() {
        distance = self.widthOfSuperLayer + self.bounds.width + abs(self.position.x);
        
        // Animated Drop Fall
        dropFallAnimation = CABasicAnimation(keyPath: "position.x")
        dropFallAnimation.duration = CFTimeInterval(distance*velocity)
        dropFallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        dropFallAnimation.fromValue = self.position.x
        if self.direction == true {
            dropFallAnimation.toValue = distance
        } else {
            dropFallAnimation.toValue = -distance
        }
        
        // Animated Drop Disappearance
        dropDisappearanceAnimation = CABasicAnimation(keyPath: "opacity")
        dropDisappearanceAnimation.duration = CFTimeInterval(dropFallAnimation.duration/4)
        dropDisappearanceAnimation.toValue = 0.0
        dropDisappearanceAnimation.fillMode = kCAFillModeForwards
        dropDisappearanceAnimation.beginTime = CFTimeInterval(dropFallAnimation.duration/4)
        
        // One animation to rule them all
        masterAnimation = CAAnimationGroup();
        masterAnimation.animations = [dropFallAnimation, dropDisappearanceAnimation]
        masterAnimation.duration = dropFallAnimation.duration
        masterAnimation.delegate = self
        masterAnimation.removedOnCompletion = true;
        
        self.addAnimation(masterAnimation, forKey: "ItsRaining")
    }
    
    override init(layer: AnyObject!) {
        super.init(layer: layer)
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if(flag) {
            // Update randomly many properties
            if self.direction == true {
                self.position.x = -(self.bounds.width + CGFloat(arc4random_uniform(UInt32(self.widthOfSuperLayer))))
            } else {
                self.position.x = self.widthOfSuperLayer + CGFloat(arc4random_uniform(UInt32(self.widthOfSuperLayer)))
            }
            
            distance = self.widthOfSuperLayer + self.bounds.width + abs(self.position.x);
            
            dropFallAnimation.duration = CFTimeInterval(distance*velocity)
            dropDisappearanceAnimation.duration = CFTimeInterval(dropFallAnimation.duration/2)
            masterAnimation.duration = dropFallAnimation.duration
            self.opacity = 0.5+(Float(arc4random()) / Float(UINT32_MAX))*0.5
            // Let's go to animate!
            self.addAnimation(masterAnimation, forKey: "ItsRaining")
            
        }
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
