//
//  MessageViewController.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit
import CoreLocation

class MessageViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var currentLocation:CLLocation!
    var weather:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchLocalization()
        
        println(weather)
        
    }
    
    //MARK: Settings Methods
    func launchLocalization() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //MARK: CLLocationManager - Delegation Methods
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        let latitude:String = String(stringInterpolationSegment: newLocation.coordinate.latitude)
        let longitude:String = String(stringInterpolationSegment: newLocation.coordinate.longitude)
        
        weather = YQL.getCurrentWeather(latitude, longitude: longitude)
        
        if weather != nil {
            locationManager.stopUpdatingLocation()
            addGradientBackgroundView()
        }
        
    }
    
    //MARK: Private methods
    func addGradientBackgroundView() {
        
//        let gradientBackgroundView = GradientView(coder: NSKeyedArchiver())
        
    }
    
    //MARK: Bullshit methods
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}