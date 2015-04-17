//
//  MessageViewController.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    var weather:NSDictionary!
    var size:CGSize!
    var origin:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.bounds = CGRect(origin: self.view.bounds.origin, size: size)
        
        createGradientBackgroundView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        createSymbolView()
    }
    
    //MARK: Private methods
    func createGradientBackgroundView() {
        
        let gradientView = GradientView(frame: self.view.frame, weather: weather)
        self.view.addSubview(gradientView)
        delay(2, closure: { () -> () in
            gradientView.animate()
        })
        
    }
    
    func createSymbolView() {
        let symbolView = SymbolView(frame: self.view.frame, weather: weather)
        self.view.addSubview(symbolView)
    }
    
    //MARK: Bullshit methods
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}