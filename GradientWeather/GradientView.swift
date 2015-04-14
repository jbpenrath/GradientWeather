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
    
    var weather:NSDictionary
    var timeGradientProperties:(colors:[CGColor]!, locations:[CGFloat]!, startPoint:CGPoint!, endPoint:CGPoint!)
    
    required init(coder aDecoder: NSCoder) {

        weather = YQL.getCurrentWeather("64.143136", longitude: "-21.940309")
        println(weather)
        
//        var date:NSDate = weather.valueForKeyPath("global.date") as! NSDate
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        let dateValue:AnyObject = weather.valueForKeyPath("global.date")!
//        let date:NSDate = dateFormatter.dateFromString()!
        let dateString:String = dateValue as! String
        println(dateString)
        super.init(coder: aDecoder)
        
    }
    
    override func drawRect(rect: CGRect) {
        
        let hour:Int = getHours(NSDate())
        
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
            default:
                println("[ERROR] - Hour isn't included in the given interval")
        }

        
        let context = UIGraphicsGetCurrentContext()
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        var code:Int = (weather.valueForKeyPath("global.code") as! String).toInt()!
        var temperature:Int = (weather.valueForKeyPath("global.temp") as! String).toInt()!
        
        var temperatureScale:Gradients.temperatureScale!
        
        //TODO: Readapt with dictionary
        
        switch code {
            case 0...7,10,12,16...20,35,41,43,45,46:
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
                else { temperatureScale = Gradients.temperatureScale.Scorching_Rainy }
                break
            case 23...26:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_Cloudy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_Cloudy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_Cloudy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_Cloudy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_Rainy }
                break
            case 27...30, 44:
                if temperature < 0 { temperatureScale = Gradients.temperatureScale.Freezing_SunnyCloudy }
                else if temperature <= 10 { temperatureScale = Gradients.temperatureScale.Cold_SunnyCloudy }
                else if temperature <= 20 { temperatureScale = Gradients.temperatureScale.Mild_SunnyCloudy }
                else if temperature <= 30 { temperatureScale = Gradients.temperatureScale.Warm_SunnyCloudy }
                else { temperatureScale = Gradients.temperatureScale.Scorching_SunnyCloudy }
                break
            case 31...34, 36:
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
        CGContextDrawLinearGradient(context, gradient, timeGradientProperties.startPoint, timeGradientProperties.endPoint, 0)
        
    }
    
    private func getHours(date:NSDate)->Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour, fromDate: date)
        
        return components.hour
        
    }
    
}