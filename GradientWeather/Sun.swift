//
//  Sun.swift
//  GradientWeather
//
//  Created by PENRATH Jean-baptiste on 03/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Sun: UIView, UIGestureRecognizerDelegate {
    
    
    let gradientBackground = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.frame = frame
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setMask()
        setGradientBackground()
        setGestureRecognizer()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Initialisation settings
    private func setMask() {
        let sunShapeMask = CAShapeLayer()
        let sunPathMask = UIBezierPath(ovalInRect: self.frame)
        sunShapeMask.path = sunPathMask.CGPath
        self.layer.mask = sunShapeMask
    }
    
    private func setGradientBackground() {
        gradientBackground.colors = [UIColor(white: 1, alpha: 0).CGColor, UIColor.whiteColor().CGColor]
        gradientBackground.frame = self.frame
        self.layer.addSublayer(gradientBackground);
    }
    
    private func setGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: Selector("displayWeather"))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
        
    }
    
    func displayWeather() -> Void {
        
    }
    
}