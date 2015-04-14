//
//  Rain.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 10/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Rain:CALayer {
    
    init(frame: CGRect, numberOfDrops: Int) {
        super.init()
        
        self.frame = frame

        // Rain
        for(var i = 0; i < numberOfDrops; i++) {
            let drop = Drop(frame: CGRect(x: CGFloat(i)*self.frame.width/CGFloat(numberOfDrops) + CGFloat(arc4random_uniform(10)), y: 0, width: CGFloat(5+arc4random_uniform(10)), height: self.frame.height))
            self.addSublayer(drop)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
