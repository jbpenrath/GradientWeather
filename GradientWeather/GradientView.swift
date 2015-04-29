//
//  GradientView.swift
//  GradientWeather
//
//  Created by PENRATH Jean-baptiste on 03/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

// TODO: Rename this view SCENE

import UIKit

class GradientView: UIView {
    
    var weather:NSDictionary?
    var timeGradientProperties:(colors:[CGColor]!, locations:[CGFloat]!, startPoint:CGPoint!, endPoint:CGPoint!)!
    let pictoLocationView:UIImageView! = UIImageView()
    let fromLabel:UILabel! = UILabel()
    let locationLabel:UILabel! = UILabel()
    let countryLabel:UILabel! = UILabel()
    
    let pictoDateView:UIImageView! = UIImageView()
    let receivedLabel:UILabel! = UILabel()
    let dateLabel:UILabel! = UILabel()
    
    var code:Int = Int()
    var city:String = String()
    var date:NSDate = NSDate()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, weather: NSDictionary?) {
        super.init(frame: frame)
        
        self.weather = weather
        
        setPictoViews()
        setLabels()
        setConstraints()
        
    }
    
    func setPictoViews() {
        pictoLocationView.image = UIImage(named: "LocationIcon-white")
        pictoLocationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        pictoDateView.image = UIImage(named: "DateIcon-white")
        pictoDateView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        pictoDateView.alpha = 0
        pictoDateView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        self.addSubview(pictoDateView)
        self.addSubview(pictoLocationView)
        
    }
    
    func setLabels() {
        
        fromLabel.text = "Sent from"
        fromLabel.font = UIFont(name: "Apercu-medium", size: 30)
//        fromLabel.textColor = UIColor(red:0.008, green:0.059, blue:0.114, alpha:1)
        fromLabel.textColor = UIColor.whiteColor()
        fromLabel.textAlignment = NSTextAlignment.Center
        if weather == nil {
            locationLabel.text = "Bourges"
        } else {
            locationLabel.text = weather?.valueForKeyPath("location.city") as? String
        }
        locationLabel.font = UIFont(name: "Apercu-medium", size: 80)
//        locationLabel.textColor = UIColor(red:0.008, green:0.059, blue:0.114, alpha:1)
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.textAlignment = NSTextAlignment.Center
        
        countryLabel.font = UIFont(name: "Apercu-medium", size: 40)
        countryLabel.textColor = UIColor.whiteColor()
        countryLabel.textAlignment = NSTextAlignment.Center
        countryLabel.text = weather?.valueForKeyPath("location.country") as? String
        
        receivedLabel.text = "On the"
        receivedLabel.font = fromLabel.font
        receivedLabel.textColor = fromLabel.textColor
        receivedLabel.textAlignment = fromLabel.textAlignment
        receivedLabel.alpha = 0
        receivedLabel.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        dateLabel.text = "17/04/15"
        dateLabel.font = UIFont(name: "Apercu-medium", size: 80)
        dateLabel.textColor = locationLabel.textColor
        dateLabel.textAlignment = locationLabel.textAlignment
        dateLabel.alpha = 0
        dateLabel.transform = CGAffineTransformMakeTranslation(-50, 0)
//        dateLabel.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        self.addSubview(receivedLabel)
        self.addSubview(dateLabel)
        self.addSubview(fromLabel)
        self.addSubview(locationLabel)
        self.addSubview(countryLabel)
        
    }
    
    func setConstraints() {
        pictoLocationView.setTranslatesAutoresizingMaskIntoConstraints(false)
        fromLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        locationLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        countryLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        pictoDateView.setTranslatesAutoresizingMaskIntoConstraints(false)
        receivedLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        dateLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let pictoLocationViewConstraintPositionY = NSLayoutConstraint(item: self.pictoLocationView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -100)
        let pictoLocationViewConstraintCenterX = NSLayoutConstraint(item: self.pictoLocationView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let fromLabelConstraintPositionY = NSLayoutConstraint(item: self.fromLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoLocationView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20)
        let fromLabelConstraintPositionX = NSLayoutConstraint(item: self.fromLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoLocationView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let locationLabelConstraintPositionY = NSLayoutConstraint(item: self.locationLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.fromLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20)
        let locationLabelConstraintPositionX = NSLayoutConstraint(item: self.locationLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoLocationView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let countryLabelConstraintPositionY = NSLayoutConstraint(item: self.countryLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.locationLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20)
        let countryLabelConstraintPositionX = NSLayoutConstraint(item: self.countryLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.locationLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let pictoDateViewConstraintPositionY = NSLayoutConstraint(item: self.pictoDateView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -100)
        let pictoDateViewConstraintCenterX = NSLayoutConstraint(item: self.pictoDateView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let receivedLabelConstraintPositionY = NSLayoutConstraint(item: self.receivedLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoDateView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20)
        let receivedLabelConstraintPositionX = NSLayoutConstraint(item: self.receivedLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoDateView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let dateLabelConstraintPositionY = NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.receivedLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20)
        let dateLabelConstraintPositionX = NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.pictoDateView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        self.addConstraint(pictoLocationViewConstraintCenterX)
        self.addConstraint(pictoLocationViewConstraintPositionY)
        self.addConstraint(fromLabelConstraintPositionX)
        self.addConstraint(fromLabelConstraintPositionY)
        self.addConstraint(locationLabelConstraintPositionX)
        self.addConstraint(locationLabelConstraintPositionY)
        self.addConstraint(countryLabelConstraintPositionX)
        self.addConstraint(countryLabelConstraintPositionY)
        
        self.addConstraint(pictoDateViewConstraintCenterX)
        self.addConstraint(pictoDateViewConstraintPositionY)
        self.addConstraint(receivedLabelConstraintPositionX)
        self.addConstraint(receivedLabelConstraintPositionY)
        self.addConstraint(dateLabelConstraintPositionX)
        self.addConstraint(dateLabelConstraintPositionY)
        
    }
    
    func animate() {
        let from:CGFloat = 0
        let to:CGFloat = 1
        let duration:CGFloat = 1
        
        CSTween.tweenFrom(1.0, to: 0.0, duration: 0.8, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.pictoLocationView.alpha = operation.value
            }, completeBlock: nil)
        CSTween.tweenFrom(1.0, to: 3.0, duration: 0.8, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.pictoLocationView.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }, completeBlock:nil)
    
        CSTween.tweenFrom(1.0, to: 0.0, duration: 0.6, delay:0.2, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.fromLabel.alpha = operation.value
            }, completeBlock: nil)
        CSTween.tweenFrom(1.0, to: 3.0, duration: 0.6, delay:0.2, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.fromLabel.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }, completeBlock:nil)
        
        CSTween.tweenFrom(1.0, to: 0.0, duration: 0.4, delay:0.4, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.locationLabel.alpha = operation.value
            }, completeBlock: nil)
        CSTween.tweenFrom(1.0, to: 3.0, duration: 0.4, delay:0.4, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.locationLabel.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }, completeBlock:nil)
        
        CSTween.tweenFrom(0.0, to: 1.0, duration: 0.8, delay:0.4, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.pictoDateView.alpha = operation.value
            self.pictoDateView.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }, completeBlock: nil)
        
        CSTween.tweenFrom(0.0, to: 1.0, duration: 0.6, delay:0.6, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.receivedLabel.alpha = operation.value
            self.receivedLabel.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }, completeBlock: nil)
        
        CSTween.tweenFrom(0.0, to: 1.0, duration: 1.0, delay:0.8, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.dateLabel.alpha = operation.value
            }, completeBlock: nil)
        CSTween.tweenFrom(-50.0, to: 0.0, duration: 1.0, delay:0.8, timingFunctionName: TweenEaseInOutElastic, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.dateLabel.transform = CGAffineTransformMakeTranslation(operation.value, 0)
            }, completeBlock: nil)
    }
    
    override func drawRect(rect: CGRect) {
        
        //TODO: Create DateFormatter to Parse YQL Date Format
        
        let hour:Int = getHours(NSDate())
//        let hour:Int = 19
        
        switch hour {
            case 0..<4:
                timeGradientProperties = Gradients.dayCycle.Night.getGradientProperties()
                break
            case 4..<6:
                timeGradientProperties = Gradients.dayCycle.FirstLight.getGradientProperties()
                break
            case 6..<9:
                timeGradientProperties = Gradients.dayCycle.Sunrise.getGradientProperties()
                break
            case 9..<11:
                timeGradientProperties = Gradients.dayCycle.Morning.getGradientProperties()
                break
            case 11..<18:
                timeGradientProperties = Gradients.dayCycle.Day.getGradientProperties()
                break
            case 18..<20:
                timeGradientProperties = Gradients.dayCycle.Twilight.getGradientProperties()
                break
            case 20:
                timeGradientProperties = Gradients.dayCycle.BlueHour.getGradientProperties()
                break
            case 21...23:
                timeGradientProperties = Gradients.dayCycle.Daybreak.getGradientProperties()
                break
            default: println("[ERROR] - Hour isn't included in the given interval")
        }

        
        let context = UIGraphicsGetCurrentContext()
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var code:Int
        var temperature:Int
        
        if weather != nil {
            code = (weather!.valueForKeyPath("global.code") as! String).toInt()!
            temperature = (weather!.valueForKeyPath("global.temp") as! String).toInt()!
        } else {
            code = 28
            temperature = 25
        }
        
        var temperatureScale:Gradients.temperatureScale!
        
        //TODO: Readapt with dictionary
        switch code {
            case 0...7,10...12,16...20,35,41,43,45,46:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_Rainy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_Rainy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_Rainy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_Rainy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_Rainy }
            break
            case 8,9,13...15,22,37...40,42,47:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_CloudyRainy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_CloudyRainy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_CloudyRainy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_CloudyRainy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_CloudyRainy }
                break
            case 23...26:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_Cloudy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_Cloudy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_Cloudy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_Cloudy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_Cloudy }
                break
            case 27...30, 44:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_SunnyCloudy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_SunnyCloudy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_SunnyCloudy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_SunnyCloudy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_SunnyCloudy }
                break
            case 31...34, 36, 3200:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_Sunny }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_Sunny }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_Sunny }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_Sunny }
                else { temperatureScale = Gradients.temperatureScale.Scorching_Sunny }
                break
            default:
                println("Code \(code) unknown.")
                break
        }
        
        var weatherGradientProperties = temperatureScale.getGradientProperties(hour)
        var gradient = CGGradientCreateWithColors(colorSpace, weatherGradientProperties.colors, weatherGradientProperties.locations)
        let options:CGGradientDrawingOptions = UInt32(kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation)
        CGContextDrawLinearGradient(context, gradient, weatherGradientProperties.startPoint, weatherGradientProperties.endPoint, options)
        
        gradient = CGGradientCreateWithColors(colorSpace, timeGradientProperties.colors, timeGradientProperties.locations)
        CGContextDrawLinearGradient(context, gradient, timeGradientProperties.startPoint, timeGradientProperties.endPoint, options)
        
    }
    
    //MARK: Private methods
    private func getHours(date:NSDate)->Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour, fromDate: date)
        
        return components.hour
    }
    
}