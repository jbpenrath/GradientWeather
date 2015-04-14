//
//  Wind.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 10/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Wind:CALayer {
    
    init(frame: CGRect, numberOfDrops: Int) {
        super.init()
        
        self.frame = frame
        self.transform = CATransform3DMakeRotation(-CGFloat(M_PI)/2, 0, 0, 1);
        
        // Wind
        for(var i = 0; i < numberOfDrops; i++) {
            let drop = Drop(frame: CGRect(x: CGFloat(i)*frame.height/CGFloat(numberOfDrops), y: 0, width: CGFloat(5+arc4random_uniform(10)), height: frame.height))
            self.addSublayer(drop)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
