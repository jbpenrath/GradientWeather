//
//  Snow.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 13/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Snow:CALayer {
    
    init(frame: CGRect, numberOfSnowFlake: Int) {
        super.init()
        
        self.frame = frame
        
        // Rain
        for(var i = 0; i < numberOfSnowFlake; i++) {
            let snowFlake = SnowFlake(frame: CGRect(x: CGFloat(i)*self.frame.width/CGFloat(numberOfSnowFlake) + CGFloat(arc4random_uniform(10)), y: 0, width: 20, height: self.frame.height))
            self.addSublayer(snowFlake)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
