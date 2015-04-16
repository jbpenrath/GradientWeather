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
    }
    
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("popToIntroViewController", sender: self)
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}
