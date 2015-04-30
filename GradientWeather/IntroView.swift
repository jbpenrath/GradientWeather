//
//  IntroView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class IntroView:UIView {
    
    let interactionLabel:UILabel = UILabel()
    let nameLabel:UILabel = UILabel()
    let readyButton:UIButton = UIButton()
    let circle = CAShapeLayer()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red:0.008, green:0.059, blue:0.114, alpha:1)
        
        setupLabels()
        setupConstraints()
        setupCircle()
    }
    
    func setupLabels() {
        interactionLabel.text = "Place your device"
        interactionLabel.font = UIFont(name: "Apercu-medium", size: 40)
        interactionLabel.textColor = UIColor.whiteColor()
        interactionLabel.textAlignment = NSTextAlignment.Center
        interactionLabel.sizeToFit()
        
        nameLabel.text = "pauline"
        nameLabel.font = UIFont(name: "National-bold", size: 24)
        nameLabel.textColor = UIColor(red:1, green:0.243, blue:0.337, alpha:1)
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.sizeToFit()

        readyButton.setTitle("READY?", forState: UIControlState.Normal)
        readyButton.titleLabel?.font = UIFont(name: "Apercu-bold", size: 20)
        readyButton.setTitleColor(UIColor(red:0.008, green:0.059, blue:0.114, alpha:1), forState: UIControlState.Normal)
        readyButton.sizeToFit()
        
        let strokeButton = CAShapeLayer()
        strokeButton.path = UIBezierPath(rect: CGRect(x: -5, y: 0, width: readyButton.bounds.width+10, height: readyButton.bounds.height)).CGPath
        strokeButton.strokeColor = UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor
        strokeButton.lineWidth = 3
        strokeButton.fillColor = UIColor.clearColor().CGColor
        
        readyButton.layer.addSublayer(strokeButton)
        
        self.addSubview(interactionLabel)
        self.addSubview(nameLabel)
        self.addSubview(readyButton)
        
    }
    
    func setupConstraints() {
        
        self.interactionLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.readyButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let interactionLabelConstraintCenterY = NSLayoutConstraint(item: self.interactionLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        let interactionLabelConstraintCenterX = NSLayoutConstraint(item: self.interactionLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let nameLabelConstraintCenterY = NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 40)
        let nameLabelConstraintCenterX = NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let readyButtonConstraintPositionY = NSLayoutConstraint(item: self.readyButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -40)
        let readyButtonConstraintCenterX = NSLayoutConstraint(item: self.readyButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        self.addConstraint(interactionLabelConstraintCenterX)
        self.addConstraint(interactionLabelConstraintCenterY)
        self.addConstraint(nameLabelConstraintCenterX)
        self.addConstraint(nameLabelConstraintCenterY)
        self.addConstraint(readyButtonConstraintCenterX)
        self.addConstraint(readyButtonConstraintPositionY)
    }
    
    func setupCircle() {
        circle.bounds = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
        circle.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
        circle.path = UIBezierPath(ovalInRect: circle.bounds).CGPath
        circle.fillColor = UIColor(red:1, green:0.243, blue:0.337, alpha:1).CGColor
        circle.zPosition = -1
        
        layer.addSublayer(circle)
    }
    
    func launchAnimation() {
        
        CSTween.tweenFrom(1.0, to: 40/self.frame.height, duration: 0.75, timingFunctionName: TweenEaseLinear, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.circle.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeScale(operation.value, operation.value))
        }, completeBlock: nil)
        
    }
    
}