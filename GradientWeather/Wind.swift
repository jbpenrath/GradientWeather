//
//  Wind.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 10/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Wind:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        let numberOfDrops:CGFloat = self.frame.height/60
        
        // Wind
        for(var i:CGFloat = 0; i < numberOfDrops; i++) {
            let blow = Blow(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat(5+arc4random_uniform(10))))
            blow.position.y = i*frame.height/numberOfDrops + CGFloat(arc4random_uniform(10))
            self.layer.addSublayer(blow)
        }
        
    }
    
    // BULLSHIT
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
