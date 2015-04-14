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
    
    init(frame: CGRect) {
        super.init();
        
        self.frame = frame
        self.heightOfSuperLayer = frame.height
        self.bounds.size = CGSize(width: frame.width, height: CGFloat(175+arc4random_uniform(100)))
        self.position.y = -(self.bounds.height + CGFloat(arc4random_uniform(UInt32(self.heightOfSuperLayer))))
        setGradient()
        setAnimation()
    }
    
    override init!(layer: AnyObject!) {
        super.init(layer: layer)
    }
    
    func setGradient() {
        self.colors = [UIColor(white: 1, alpha: 0).CGColor, UIColor(white: 1.0, alpha: 0.9).CGColor, UIColor(white: 1, alpha: 0).CGColor]
        self.locations = [0, 0.7, 1]
    }
    
    func setAnimation() {
        distance = self.position.y + self.heightOfSuperLayer*1.5;
        
        // Animated Drop Fall
        dropFallAnimation = CABasicAnimation(keyPath: "position.y")
        dropFallAnimation.duration = CFTimeInterval(3.5*distance/1000)
        dropFallAnimation.fromValue = self.position.y
        dropFallAnimation.toValue = self.heightOfSuperLayer + self.bounds.height
        
        // Animated Drop Disappearance
        dropDisappearanceAnimation = CABasicAnimation(keyPath: "opacity")
        dropDisappearanceAnimation.duration = dropFallAnimation.duration/3.5
        dropDisappearanceAnimation.toValue = 0.0
        dropDisappearanceAnimation.fillMode = kCAFillModeForwards
        dropDisappearanceAnimation.beginTime = dropFallAnimation.duration/3.5
        
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
            self.position.y = -(self.bounds.height + CGFloat(arc4random_uniform(UInt32(self.heightOfSuperLayer))))
            distance = self.position.y + self.heightOfSuperLayer*1.5
            dropFallAnimation.duration = CFTimeInterval(3.5*distance/1000)
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