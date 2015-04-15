//
//  SceneViewController.swift
//  GradientWeather
//
//  Created by jbpenrath on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//        self.view.frame.origin.x = -self.view.bounds.width/3
        
        let view:SceneView = self.view as! SceneView
        view.setIntroView()
        
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}
