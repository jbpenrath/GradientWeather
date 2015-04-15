//
//  SceneView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class SceneView:UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal func setIntroView() {
        
        let view:IntroView = IntroView(frame: self.bounds)
        self.addSubview(view)
        
    }
    
}
