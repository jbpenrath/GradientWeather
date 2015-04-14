//
//  WeatherGradient.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 02/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class WeatherGradient: CALayer {
    
    var timeGradient:CAGradientLayer!
    var weatherGradient:CAGradientLayer!
    
    
    required init(coder:NSCoder) {
        super.init(coder: coder)
    }
    
    init(layer:CALayer, date:NSDate, weather:Gradients.temperatureScale) {
        super.init()
        self.frame = layer.frame
        
//        let hour:Int = getHours(date)
        let hour:Int = 19
        
        switch hour {
        case 0..<4:
            timeGradient = Gradients.dayCycle.Night.getColorfulAmbience()
            break
        case 4..<6:
            timeGradient = Gradients.dayCycle.FirstLight.getColorfulAmbience()
            break
        case 6..<9:
            timeGradient = Gradients.dayCycle.Sunrise.getColorfulAmbience()
            break
        case 9..<11:
            timeGradient = Gradients.dayCycle.Morning.getColorfulAmbience()
            break
        case 11..<18:
            timeGradient = Gradients.dayCycle.Day.getColorfulAmbience()
            break
        case 18..<20:
            timeGradient = Gradients.dayCycle.Twilight.getColorfulAmbience()
            break
        case 20:
            timeGradient = Gradients.dayCycle.BlueHour.getColorfulAmbience()
            break
        case 21...23:
            timeGradient = Gradients.dayCycle.Daybreak.getColorfulAmbience()
            break
        default:
            println("[ERROR] - Hour isn't included in the given interval")
        }
        

        timeGradient.frame = self.frame
        
        weatherGradient = weather.getColorfulAmbience()
        weatherGradient.frame = self.frame
        
        self.insertSublayer(weatherGradient, atIndex: 0)
        self.insertSublayer(timeGradient, above: weatherGradient)
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = timeGradient.colors
        colorAnimation.toValue = Gradients.dayCycle.Sunrise.getColorfulAmbience().colors
        
        let startPointXAnimation = CABasicAnimation(keyPath: "startPoint.x")
        startPointXAnimation.fromValue = timeGradient.startPoint.x
        startPointXAnimation.toValue = Gradients.dayCycle.Sunrise.getColorfulAmbience().startPoint.x
        
        let startPointYAnimation = CABasicAnimation(keyPath: "startPoint.y")
        startPointYAnimation.fromValue = timeGradient.startPoint.y
        startPointYAnimation.toValue = Gradients.dayCycle.Sunrise.getColorfulAmbience().startPoint.y

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [colorAnimation, startPointXAnimation, startPointYAnimation]
        groupAnimation.duration = 3
        groupAnimation.autoreverses = true
        groupAnimation.repeatCount = Float.infinity
        
//        timeGradient.addAnimation(groupAnimation, forKey: "basic")
        
        
    }
    
    private func getHours(date:NSDate)->Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour, fromDate: date)
        
        return components.hour
        
    }

    
}