//
//  Rain.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 10/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Rain:UIView {
    
    var drops:[Drop]! = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        let numberOfDrops:CGFloat = self.frame.width/40
        
        // Rain
        for(var i:CGFloat = 0; i < numberOfDrops; i++) {
            let drop = Drop(frame: CGRect(x: 0, y: 0, width: CGFloat(5+arc4random_uniform(10)), height: self.frame.height))
            drop.position.x = i*self.frame.width/numberOfDrops + CGFloat(arc4random_uniform(10))
            self.layer.addSublayer(drop)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
