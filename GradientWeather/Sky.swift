//
//  Sky.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 13/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Sky:CALayer {
    
    init(frame: CGRect, numberOfCloud: Int) {
        super.init()
        
        self.frame = frame
        var scale:CGFloat = 1
        
        // Rain
        for(var i = 0; i < numberOfCloud; i++) {
            let cloud = Cloud(frame: CGRect(x: 0, y: CGFloat(i)*self.frame.height/CGFloat(numberOfCloud) + CGFloat(arc4random_uniform(90)), width: self.frame.width, height: 90))
//            self.view.layer.addSublayer(cloud)
//            let cloud = Cloud(frame: CGRect(x: CGFloat(i)*self.frame.width/CGFloat(numberOfCloud) + CGFloat(arc4random_uniform(10)), y: 0, width: CGFloat(5+arc4random_uniform(10)), height: self.frame.height))
            
            scale = CGFloat(0.5 + 0.5 * Float(arc4random()) / Float(UINT32_MAX))
            cloud.transform = CATransform3DMakeScale(scale, scale, 0)
            self.addSublayer(cloud)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
