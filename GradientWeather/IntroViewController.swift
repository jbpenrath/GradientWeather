//
//  IntroViewController.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class IntroViewController:UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var introView: IntroView!
    @IBOutlet var readyButton: UIButton!
    @IBOutlet var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        nameLabel.text = "Kristophert"
        nameLabel.sizeToFit()
        
        instructionLabel.font = UIFont(name: "Apercu-Medium", size: 40)
        
        let strokeButton = CAShapeLayer()
        strokeButton.path = UIBezierPath(rect: CGRect(x: -5, y: 0, width: readyButton.bounds.width+10, height: readyButton.bounds.height)).CGPath
        strokeButton.strokeColor = UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor
        strokeButton.lineWidth = 3
        strokeButton.fillColor = UIColor.clearColor().CGColor
        
        readyButton.layer.addSublayer(strokeButton)
        readyButton.addTarget(self, action: "readyToRead", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func readyToRead() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.instructionLabel.alpha = 0
            self.readyButton.alpha = 0
        }) { (finished) -> Void in
            if(finished) {
                self.instructionLabel.removeFromSuperview()
                self.readyButton.removeFromSuperview()
                self.introView.launchAnimation()
            }
        }
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}
