//
//  SceneViewController.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 02/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit
import CoreLocation

class SceneViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var currentLocation:CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

        let sun = Sun(frame: CGRect(x: 0, y: 0, width: 95, height: 95))
        sun.layer.position = CGPoint(x: self.view.frame.width*3/4, y: 100)
//        view.addSubview(sun)
        
        view.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height/2)
        
        let rain:Rain = Rain(frame: self.view.frame)
//        self.view.layer.addSublayer(rain)
//
//        let wind:Wind = Wind(frame: self.view.frame, numberOfDrops: 30)
//        self.view.layer.addSublayer(wind);

//        let snow = Snow(frame: self.view.frame, numberOfSnowFlake: 30)
//        self.view.layer.addSublayer(snow)
        
        
//        let sky = Sky(frame: self.view.frame, numberOfCloud: 5)
//        self.view.layer.addSublayer(sky)
        
        
        
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if(flag) {
//            Country.textColor = UIColor(hue:0.6, saturation:0.714, brightness:0.22, alpha:1)
        }
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    //MARK: Delegation methods - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        locationManager.stopUpdatingLocation()
        
        let weather:NSDictionary = YQL.getCurrentWeather(String(stringInterpolationSegment: newLocation.coordinate.latitude), longitude: String(stringInterpolationSegment: newLocation.coordinate.longitude))
        
        setupCountry(weather.valueForKeyPath("location.city") as! String)
//        TemperatureLabel.text = weather.valueForKeyPath("global.temp") as? String
//        StatusWeather.text = weather.valueForKeyPath("global.text") as? String
        
        var view = self.view as! GradientView
        
        view.weather = weather
        
        view.setNeedsDisplay()
        
    }
    
//    func setupCountry(name:String) {
//        
//        Country.text = name
//        
//        println(name)
//        
//        let gradient = CAGradientLayer();
//        gradient.frame = view.bounds;
//        gradient.colors = [UIColor(hue:0.6, saturation:0.714, brightness:0.22, alpha:1).CGColor, UIColor(white: 1, alpha: 0).CGColor]
//        gradient.locations = [0, 0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.5);
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.5);
//        
//        let maskLayer = CATextLayer();
//        maskLayer.string = Country.text
//        maskLayer.font = Country.font.fontName
//        maskLayer.fontSize = Country.font.pointSize
//        maskLayer.shouldRasterize = true
//        
//        
//        maskLayer.frame = view.frame
//        
//        gradient.mask = maskLayer;
//        
//        let animationColors = CABasicAnimation(keyPath: "colors")
//        animationColors.toValue = [UIColor(hue:0.6, saturation:0.714, brightness:0.22, alpha:1).CGColor, UIColor(hue:0.6, saturation:0.714, brightness:0.22, alpha:1).CGColor]
//        let animationLocations = CABasicAnimation(keyPath: "locations")
//        animationLocations.toValue = [0, 1.0]
//        let animationGradient = CAAnimationGroup()
//        animationGradient.animations = [animationColors, animationLocations]
//        animationGradient.duration = 1.5
//        animationGradient.removedOnCompletion = true
//        animationGradient.delegate = self;
//        gradient.addAnimation(animationGradient, forKey: "ShowCountry")
//        
//        Country.layer.addSublayer(gradient);
//        Country.textColor = UIColor.clearColor();
//    }
    
}

