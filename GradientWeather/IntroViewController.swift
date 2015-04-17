//
//  IntroViewController.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit
import CoreLocation

class IntroViewController:UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var currentLocation:CLLocation!
    var introView:IntroView!
    var videoView:VideoView!
    var size:CGSize!
    var origin:CGPoint!
    var weather:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchLocalization()
        
        let numberOfDevices:CGFloat = 1
        
        size = CGSize(width: self.view.frame.width * numberOfDevices, height: self.view.frame.height)
        origin = CGPoint(x: self.view.frame.origin.x, y: self.view.frame.origin.y)
        
        self.view.layer.bounds = CGRect(origin: self.view.bounds.origin, size: size)
        
        println(self.view.frame)
        introView = IntroView(frame: self.view.frame)
        introView.readyButton.addTarget(self, action: "readyToRead", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(introView)
        
    }
    
    func readyToRead() {
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            self.introView.interactionLabel.alpha = 0
            self.introView.readyButton.alpha = 0
            }) { (finished) -> Void in
                if(finished) {
                    self.introView.interactionLabel.removeFromSuperview()
                    self.introView.readyButton.removeFromSuperview()
                    self.introView.launchAnimation()
                    self.delay(1.6) {
                        self.performSegueWithIdentifier("popToMessageViewController", sender: self)
                    }
                }
        }
    }
    
    func launchLocalization() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "popToMessageViewController" {
            let destinationController:MessageViewController = segue.destinationViewController as! MessageViewController
            destinationController.size = size
            destinationController.origin = origin
            destinationController.weather = weather
        }
    }
    
    //MARK: CLLocationManager - Delegation Methods
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        let latitude:String = String(stringInterpolationSegment: newLocation.coordinate.latitude)
        let longitude:String = String(stringInterpolationSegment: newLocation.coordinate.longitude)
        
        weather = YQL.getCurrentWeather(latitude, longitude: longitude)
        
        if weather != nil {
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
}
