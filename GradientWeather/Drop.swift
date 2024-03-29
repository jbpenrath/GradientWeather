//
//  Drop.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 05/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Drop: CAGradientLayer {
    
//    var dropGradientLayer:CAGradientLayer!
    var dropFallAnimation:CABasicAnimation!
    var dropDisappearanceAnimation:CABasicAnimation!
    var masterAnimation:CAAnimationGroup!
    var distance:CGFloat = 0.0
    var heightOfSuperLayer:CGFloat = 0.0
    let velocity:CGFloat = 5/1000
    
    init(frame: CGRect) {
        super.init();
        
        self.bounds = frame
        self.heightOfSuperLayer = self.frame.height
        self.bounds.size = CGSize(width: frame.width, height: CGFloat(175+arc4random_uniform(100)))
        self.opacity = 0.75+(Float(arc4random()) / Float(UINT32_MAX))*0.25
        self.position.y = -CGFloat(arc4random_uniform(UInt32(self.heightOfSuperLayer)))*0.5
        self.anchorPoint = CGPoint(x: 0.5, y: 1)
        setGradient()
        setAnimation()
    }
    
    override init(layer: AnyObject!) {
        super.init(layer: layer)
    }
    
    func setGradient() {
        self.colors = [UIColor(white: 1, alpha: 0).CGColor, UIColor(white: 1.0, alpha: 0.9).CGColor, UIColor(white: 1, alpha: 0).CGColor]
        self.locations = [0, 0.7, 1]
    }
    
    func setAnimation() {
        distance = self.position.y + self.heightOfSuperLayer;
        
        // Animated Drop Fall
        dropFallAnimation = CABasicAnimation(keyPath: "position.y")
        dropFallAnimation.duration = CFTimeInterval(distance*velocity)
        dropFallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        dropFallAnimation.fromValue = self.position.y
        dropFallAnimation.toValue = self.heightOfSuperLayer + self.bounds.height
        
        // Animated Drop Disappearance
        dropDisappearanceAnimation = CABasicAnimation(keyPath: "opacity")
        dropDisappearanceAnimation.duration = dropFallAnimation.duration/2.5
        dropDisappearanceAnimation.toValue = 0.0
        dropDisappearanceAnimation.fillMode = kCAFillModeForwards
        dropDisappearanceAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        dropDisappearanceAnimation.beginTime = dropFallAnimation.duration/2.5
        
        // One animation to rule them all
        masterAnimation = CAAnimationGroup();
        masterAnimation.animations = [dropFallAnimation, dropDisappearanceAnimation]
        masterAnimation.duration = dropFallAnimation.duration
        masterAnimation.delegate = self
        masterAnimation.removedOnCompletion = true;
        
        self.addAnimation(masterAnimation, forKey: "ItsRaining")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if(flag) {
            // Update randomly many properties
            self.position.y = -CGFloat(arc4random_uniform(UInt32(self.heightOfSuperLayer)))
            self.opacity = 0.75+(Float(arc4random()) / Float(UINT32_MAX))*0.25
            distance = self.position.y + self.heightOfSuperLayer
            dropFallAnimation.duration = CFTimeInterval(distance*velocity)
            dropDisappearanceAnimation.duration = dropFallAnimation.duration/2.5
            masterAnimation.duration = dropFallAnimation.duration

            // Let's go to animate!
            self.addAnimation(masterAnimation, forKey: "ItsRaining")
            
        }
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}