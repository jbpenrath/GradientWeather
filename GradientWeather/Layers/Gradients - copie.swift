//
//  Gradients.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 02/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class Gradients {
    
    enum dayCycle {
        case Night, FirstLight, Sunrise, Morning, Day, Twilight, BlueHour, Daybreak
        
        func getColorfulAmbience() -> CAGradientLayer! {
            
            let colorfulAmbience:CAGradientLayer = CAGradientLayer();
            
            switch (self) {
                case .Night:
                    println("[DEBUG] - Night")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.99).CGColor, UIColor(hue:0, saturation:0, brightness:0, alpha:0.95).CGColor]
                    colorfulAmbience.startPoint = CGPoint(x: 0.5, y: 1.0)
                    colorfulAmbience.endPoint = CGPoint(x: 0.5, y: 0.0)
                    break
                case FirstLight:
                    println("[DEBUG] - FirstLight")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.7).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.99).CGColor]
                    colorfulAmbience.startPoint = CGPoint(x: 0.0, y:1.0)
                    colorfulAmbience.endPoint = CGPoint(x: 1.0, y:1.0)
                    break
                case Sunrise:
                    println("[DEBUG] - Sunrise")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.7).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:1).CGColor]
                    colorfulAmbience.locations = [0,0.4, 0.8, 1]
                    colorfulAmbience.startPoint = CGPoint(x: 0.0, y: 0.5)
                    colorfulAmbience.endPoint = CGPoint(x: 1.0, y: 0.5)
                    break
                case Morning:
                    println("[DEBUG] - Morning")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.5).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.7).CGColor]
                    colorfulAmbience.startPoint = CGPoint(x: 0.0, y: 0.0)
                    colorfulAmbience.endPoint = CGPoint(x: 1.0, y: 1.0)
                    break
                case Day:
                    println("[DEBUG] - Day")
                    colorfulAmbience.colors = [UIColor(hue:1, saturation:1, brightness:1, alpha:0.1).CGColor, UIColor(hue:1, saturation:1, brightness:1, alpha:0).CGColor]
                    break
                case Twilight:
                    println("[DEBUG] - Twilight")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.7).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.5).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0).CGColor]
                    colorfulAmbience.startPoint = CGPoint(x: 1.0, y: 0.0)
                    colorfulAmbience.endPoint = CGPoint(x: 0.0, y: 1.0)
                    break
                case BlueHour:
                    println("[DEBUG] - BlueHour")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.99).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.8).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0).CGColor]
                    colorfulAmbience.locations = [0, 0.4, 1]
                    colorfulAmbience.startPoint = CGPoint(x: 1.0, y: 0.5)
                    colorfulAmbience.endPoint = CGPoint(x: 0.0, y: 0.5)
                    break
                case Daybreak:
                    println("[DEBUG] - Daybreak")
                    colorfulAmbience.colors = [UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.99).CGColor, UIColor(hue:0.59, saturation:0.93, brightness:0.11, alpha:0.9).CGColor]
                    colorfulAmbience.locations = [0.4, 1]
                    colorfulAmbience.startPoint = CGPoint(x: 1.0, y: 1.0)
                    colorfulAmbience.endPoint = CGPoint(x: 0.0, y: 0.0)
                    break
                default:
                    println("[ERROR] - No case for this value")
                    break
            }
            
            return colorfulAmbience;
            
        }
        
    }
    
    enum temperatureScale {
        case Freezing_Sunny, Freezing_SunnyCloudy, Freezing_Cloudy, Freezing_CloudyRainy, Freezing_Rainy,
        Cold_Sunny, Cold_SunnyCloudy, Cold_Cloudy, Cold_CloudyRainy, Cold_Rainy,
        Mild_Sunny, Mild_SunnyCloudy, Mild_Cloudy, Mild_CloudyRainy, Mild_Rainy,
        Warm_Sunny, Warm_SunnyCloudy, Warm_Cloudy, Warm_CloudyRainy, Warm_Rainy,
        Scorching_Sunny, Scorching_SunnyCloudy, Scorching_Cloudy, Scorching_CloudyRainy, Scorching_Rainy
        
        func getColorfulAmbience() -> CAGradientLayer? {
            
            var colorfulAmbience:CAGradientLayer = CAGradientLayer();
            
            switch(self) {
            case Freezing_Sunny:
                println("[DEBUG] - Freezing_Sunny")
                colorfulAmbience.backgroundColor = UIColor(hue:0.49, saturation:0.2, brightness:0.99, alpha:1).CGColor
                break
            case Freezing_SunnyCloudy:
                println("[DEBUG] - Freezing_SunnyCloudy")
                colorfulAmbience.colors = [UIColor(hue:0.49, saturation:0.2, brightness:0.99, alpha:1).CGColor, UIColor(hue:0.54, saturation:0.17, brightness:0.95, alpha:1).CGColor];
                break
            case Freezing_Cloudy:
                println("[DEBUG] - Freezing_Cloudy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.54, saturation:0.17, brightness:0.95, alpha:1).CGColor
                break
            case Freezing_CloudyRainy:
                println("[DEBUG] - Freezing_CloudyRainy")
                colorfulAmbience.colors = [UIColor(hue:0.54, saturation:0.17, brightness:0.95, alpha:1).CGColor, UIColor(hue:0, saturation:0, brightness:0.95, alpha:1).CGColor]
                break
            case Freezing_Rainy:
                println("[DEBUG] - Freezing_Rainy")
                colorfulAmbience.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.95, alpha:1).CGColor
                break
            case Cold_Sunny:
                println("[DEBUG] - Cold_Sunny")
                colorfulAmbience.backgroundColor = UIColor(hue:0.62, saturation:0.51, brightness:0.98, alpha:1).CGColor
                break
            case Cold_SunnyCloudy:
                println("[DEBUG] - Cold_SunnyCloudy")
                colorfulAmbience.colors = [UIColor(hue:0.62, saturation:0.51, brightness:0.98, alpha:1).CGColor, UIColor(hue:0.57, saturation:0.34, brightness:0.85, alpha:1).CGColor]
                break
            case Cold_Cloudy:
                println("[DEBUG] - Cold_Cloudy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.57, saturation:0.34, brightness:0.85, alpha:1).CGColor
                break
            case Cold_CloudyRainy:
                println("[DEBUG] - Cold_CloudyRainy")
                colorfulAmbience.colors = [UIColor(hue:0.57, saturation:0.34, brightness:0.85, alpha:1).CGColor, UIColor(hue:0, saturation:0, brightness:0.9, alpha:1).CGColor]
                break
            case Cold_Rainy:
                println("[DEBUG] - Cold_Rainy")
                colorfulAmbience.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.9, alpha:1).CGColor
                break
            case Mild_Sunny:
                println("[DEBUG] - Mild_Sunny")
                colorfulAmbience.backgroundColor = UIColor(hue:0.13, saturation:0.26, brightness:1, alpha:1).CGColor
                break
            case Mild_SunnyCloudy:
                println("[DEBUG] - Mild_SunnyCloudy")
                colorfulAmbience.colors = [UIColor(hue:0.13, saturation:0.26, brightness:1, alpha:1).CGColor, UIColor(hue:0.31, saturation:0.1, brightness:0.95, alpha:1).CGColor]
                break
            case Mild_Cloudy:
                println("[DEBUG] - Mild_Cloudy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.31, saturation:0.1, brightness:0.95, alpha:1).CGColor
                break
            case Mild_CloudyRainy:
                println("[DEBUG] - Mild_CloudyRainy")
                colorfulAmbience.colors = [UIColor(hue:0.31, saturation:0.1, brightness:0.95, alpha:1).CGColor, UIColor(hue:0.11, saturation:0.04, brightness:0.9, alpha:1).CGColor]
                break
            case Mild_Rainy:
                println("[DEBUG] - Mild_Rainy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.11, saturation:0.04, brightness:0.9, alpha:1).CGColor
                break
            case Warm_Sunny:
                println("[DEBUG] - Warm_Sunny")
                colorfulAmbience.backgroundColor = UIColor(hue:0.04, saturation:0.55, brightness:0.95, alpha:1).CGColor
                break
            case Warm_SunnyCloudy:
                println("[DEBUG] - Warm_SunnyCloudy")
                colorfulAmbience.colors = [UIColor(hue:0.04, saturation:0.55, brightness:0.95, alpha:1).CGColor, UIColor(hue:0.1, saturation:0.37, brightness:1, alpha:1).CGColor]
                break
            case Warm_Cloudy:
                println("[DEBUG] - Warm_Cloudy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.1, saturation:0.37, brightness:1, alpha:1).CGColor
                break
            case Warm_CloudyRainy:
                println("[DEBUG] - Warm_CloudyRainy")
                colorfulAmbience.colors = [UIColor(hue:0.1, saturation:0.37, brightness:1, alpha:1).CGColor, UIColor(hue:0.08, saturation:0.26, brightness:0.89, alpha:1).CGColor]
                break
            case Warm_Rainy:
                println("[DEBUG] - Warm_Rainy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.08, saturation:0.26, brightness:0.89, alpha:1).CGColor
                break
            case Scorching_Sunny:
                println("[DEBUG] - Scorching_Sunny")
                colorfulAmbience.backgroundColor = UIColor(hue:0.99, saturation:0.72, brightness:1, alpha:1).CGColor
                break
            case Scorching_SunnyCloudy:
                println("[DEBUG] - Scorching_SunnyCloudy")
                colorfulAmbience.colors = [UIColor(hue:0.99, saturation:0.72, brightness:1, alpha:1).CGColor, UIColor(hue:0.08, saturation:0.57, brightness:0.97, alpha:1).CGColor]
                break
            case Scorching_Cloudy:
                println("[DEBUG] - Scorching_Cloudy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.08, saturation:0.57, brightness:0.97, alpha:1).CGColor
                break
            case Scorching_CloudyRainy:
                println("[DEBUG] - Scorching_CloudyRainy")
                colorfulAmbience.colors = [UIColor(hue:0.08, saturation:0.57, brightness:0.97, alpha:1).CGColor, UIColor(hue:0.03, saturation:0.42, brightness:0.88, alpha:1).CGColor]
                break
            case Scorching_Rainy:
                println("[DEBUG] - Scorching_Rainy")
                colorfulAmbience.backgroundColor = UIColor(hue:0.03, saturation:0.42, brightness:0.88, alpha:1).CGColor
                break
            default:
                println("[ERROR] - No case for this value")
                break
            }
            
            return colorfulAmbience;
            
        }
        
    }
    
}