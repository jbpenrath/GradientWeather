//
//  Gradients.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 02/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

// TODO: Transform in Dictionary

import UIKit

class Gradients {
    
    enum dayCycle {
        case Night, FirstLight, Sunrise, Morning, Day, Twilight, BlueHour, Daybreak
        
        func getGradientProperties() -> (colors:[CGColor]!, locations:[CGFloat]!, startPoint:CGPoint!, endPoint:CGPoint!) {

            let boundsScreen = UIScreen.mainScreen().bounds
            var colors: [CGColor]
            var locations: [CGFloat] = [0.0, 1.0]
            var startPoint: CGPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0)
            var endPoint: CGPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
            
            switch self {
                case .Night:
                    println("[DEBUG] - Night")
                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.7).CGColor]
                    startPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: 0.0)
                    break
                case FirstLight:
                    println("[DEBUG] - FirstLight")
//                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.01, green:0.05, blue:0.12, alpha:0.7).CGColor]
                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.94).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.75).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.7).CGColor]
                    locations = [0, 0.1, 0.45, 0.91]
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0.0)
                    break
                case Sunrise:
                    println("[DEBUG] - Sunrise")
//                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(white: 1.0, alpha: 0).CGColor]
//                    locations = [0.075, 1.0]
                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.161, green:0.2, blue:0.255, alpha:0.95).CGColor, UIColor(red:0.275, green:0.31, blue:0.357, alpha:0.81).CGColor, UIColor(red:0.439, green:0.467, blue:0.502, alpha:0.5).CGColor, UIColor(white: 1.0, alpha: 0.3).CGColor]
                    locations = [0, 0.27, 0.5, 0.68, 0.93]
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0.0)
                    break
                case Morning:
                    println("[DEBUG] - Morning")
//                    colors = [UIColor(red:0.26, green:0.29, blue:0.35, alpha:1.0).CGColor, UIColor(white: 1.0, alpha: 0.0).CGColor]
                    colors = [UIColor(red:0.031, green:0.075, blue:0.137, alpha:0.98).CGColor, UIColor(red:0.678, green:0.69, blue:0.714, alpha:0.53).CGColor, UIColor(white: 1.0, alpha: 0.3).CGColor]
                    locations = [0, 0.48, 1]
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0.0)
                    break
                case Day:
                    println("[DEBUG] - Day")
                    colors = [UIColor(white: 1.0, alpha: 0.3).CGColor, UIColor(white: 1.0, alpha:0.0).CGColor]
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: 0.0)
                    endPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen))
                    break
                case Twilight:
                    println("[DEBUG] - Twilight")
//                    colors = [UIColor(red:0.25, green:0.28, blue:0.33, alpha:1.0).CGColor, UIColor(white: 1.0, alpha:0.0).CGColor]
                    colors = [UIColor(red:0.031, green:0.075, blue:0.137, alpha:0.98).CGColor, UIColor(red:0.678, green:0.69, blue:0.714, alpha:0.53).CGColor, UIColor(white: 1.0, alpha: 0.3).CGColor]
                    locations = [0, 0.48, 1]
                    break
                case BlueHour:
                    println("[DEBUG] - BlueHour")
//                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(white: 1.0, alpha:0.0).CGColor]
//                    locations = [0.075, 1.0]
                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.161, green:0.2, blue:0.255, alpha:0.95).CGColor, UIColor(red:0.275, green:0.31, blue:0.357, alpha:0.81).CGColor, UIColor(red:0.439, green:0.467, blue:0.502, alpha:0.5).CGColor, UIColor(white: 1.0, alpha: 0.3).CGColor]
                    locations = [0, 0.27, 0.5, 0.68, 0.93]
                    break
                case Daybreak:
                    println("[DEBUG] - Daybreak")
//                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.7).CGColor]
                    colors = [UIColor(red:0.008, green:0.059, blue:0.114, alpha:1).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.94).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.75).CGColor, UIColor(red:0.008, green:0.059, blue:0.114, alpha:0.7).CGColor]
                    locations = [0, 0.1, 0.45, 0.91]
                    break
                default:
                    println("[ERROR] - No case for this value")
                    break
            }
            
            return (colors, locations, startPoint, endPoint)
            
        }
        
    }
    
    enum temperatureScale {
        case Freezing_Sunny, Freezing_SunnyCloudy, Freezing_Cloudy, Freezing_CloudyRainy, Freezing_Rainy,
        Cold_Sunny, Cold_SunnyCloudy, Cold_Cloudy, Cold_CloudyRainy, Cold_Rainy,
        Mild_Sunny, Mild_SunnyCloudy, Mild_Cloudy, Mild_CloudyRainy, Mild_Rainy,
        Warm_Sunny, Warm_SunnyCloudy, Warm_Cloudy, Warm_CloudyRainy, Warm_Rainy,
        Scorching_Sunny, Scorching_SunnyCloudy, Scorching_Cloudy, Scorching_CloudyRainy, Scorching_Rainy
        
        func getGradientProperties(hour:Int) -> (colors:[CGColor]!, locations:[CGFloat]!, startPoint:CGPoint!, endPoint:CGPoint!) {
            
            let boundsScreen = UIScreen.mainScreen().bounds
            var colors: [CGColor]
            var locations: [CGFloat] = [0 ,1]
            var startPoint: CGPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0.0)
            var endPoint: CGPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
            
            switch self {
                case Freezing_Sunny:
                    println("[DEBUG] - Freezing_Sunny")
                    colors = [UIColor(red:0.8, green:0.99, blue:0.98, alpha:1.0).CGColor]
                    break
                case Freezing_SunnyCloudy:
                    println("[DEBUG] - Freezing_SunnyCloudy")
                    colors = [UIColor(red:0.8, green:0.99, blue:0.98, alpha:1.0).CGColor, UIColor(red:0.79, green:0.9, blue:0.95, alpha:1).CGColor];
                    break
                case Freezing_Cloudy:
                    println("[DEBUG] - Freezing_Cloudy")
                    colors = [UIColor(red:0.79, green:0.9, blue:0.95, alpha:1).CGColor]
                    break
                case Freezing_CloudyRainy:
                    println("[DEBUG] - Freezing_CloudyRainy")
                    colors = [UIColor(red:0.79, green:0.9, blue:0.95, alpha:1).CGColor, UIColor(red:0.95, green:0.95, blue:0.95, alpha:1).CGColor]
                    break
                case Freezing_Rainy:
                    println("[DEBUG] - Freezing_Rainy")
                    colors = [UIColor(red:0.95, green:0.95, blue:0.95, alpha:1).CGColor]
                    break
                case Cold_Sunny:
                    println("[DEBUG] - Cold_Sunny")
                    colors = [UIColor(red:0.47, green:0.6, blue:1, alpha:1).CGColor]
                    break
                case Cold_SunnyCloudy:
                    println("[DEBUG] - Cold_SunnyCloudy")
                    colors = [UIColor(red:0.47, green:0.6, blue:1, alpha:1).CGColor, UIColor(red:0.57, green:0.73, blue:0.86, alpha:1).CGColor]
                    break
                case Cold_Cloudy:
                    println("[DEBUG] - Cold_Cloudy")
                    colors = [UIColor(red:0.57, green:0.73, blue:0.86, alpha:1).CGColor]
                    break
                case Cold_CloudyRainy:
                    println("[DEBUG] - Cold_CloudyRainy")
                    colors = [UIColor(red:0.57, green:0.73, blue:0.86, alpha:1).CGColor, UIColor(red:0.9, green:0.9, blue:0.9, alpha:1).CGColor]
                    break
                case Cold_Rainy:
                    println("[DEBUG] - Cold_Rainy")
                    colors = [UIColor(red:0.9, green:0.9, blue:0.9, alpha:1).CGColor]
                    break
                case Mild_Sunny:
                    println("[DEBUG] - Mild_Sunny")
                    colors = [UIColor(red:1, green:0.95, blue:0.71, alpha:1).CGColor]
                    break
                case Mild_SunnyCloudy:
                    println("[DEBUG] - Mild_SunnyCloudy")
                    colors = [UIColor(red:1, green:0.95, blue:0.71, alpha:1).CGColor, UIColor(red:0.87, green:0.95, blue:0.84, alpha:1).CGColor]
                    break
                case Mild_Cloudy:
                    println("[DEBUG] - Mild_Cloudy")
                    colors = [UIColor(red:0.87, green:0.95, blue:0.84, alpha:1).CGColor]
                    break
                case Mild_CloudyRainy:
                    println("[DEBUG] - Mild_CloudyRainy")
                    colors = [UIColor(red:0.87, green:0.95, blue:0.84, alpha:1).CGColor, UIColor(red:0.9, green:0.89, blue:0.86, alpha:1).CGColor]
                    break
                case Mild_Rainy:
                    println("[DEBUG] - Mild_Rainy")
                    colors = [UIColor(red:0.9, green:0.89, blue:0.86, alpha:1).CGColor]
                    break
                case Warm_Sunny:
                    println("[DEBUG] - Warm_Sunny")
                    colors = [UIColor(red:0.94, green:0.56, blue:0.41, alpha:1).CGColor]
                    break
                case Warm_SunnyCloudy:
                    println("[DEBUG] - Warm_SunnyCloudy")
                    colors = [UIColor(red:0.94, green:0.56, blue:0.41, alpha:1).CGColor, UIColor(red:1, green:0.85, blue:0.6, alpha:1).CGColor]
                    break
                case Warm_Cloudy:
                    println("[DEBUG] - Warm_Cloudy")
                    colors = [UIColor(red:1, green:0.85, blue:0.6, alpha:1).CGColor]
                    break
                case Warm_CloudyRainy:
                    println("[DEBUG] - Warm_CloudyRainy")
                    colors = [UIColor(red:1, green:0.85, blue:0.6, alpha:1).CGColor, UIColor(red:0.89, green:0.77, blue:0.65, alpha:1).CGColor]
                    break
                case Warm_Rainy:
                    println("[DEBUG] - Warm_Rainy")
                    colors = [UIColor(red:0.89, green:0.77, blue:0.65, alpha:1).CGColor]
                    break
                case Scorching_Sunny:
                    println("[DEBUG] - Scorching_Sunny")
                    colors = [UIColor(red:1, green:0.3, blue:0.3, alpha:1).CGColor]
                    break
                case Scorching_SunnyCloudy:
                    println("[DEBUG] - Scorching_SunnyCloudy")
                    colors = [UIColor(red:1, green:0.3, blue:0.3, alpha:1).CGColor, UIColor(red:0.97, green:0.67, blue:0.38, alpha:1).CGColor]
                    break
                case Scorching_Cloudy:
                    println("[DEBUG] - Scorching_Cloudy")
                    colors = [UIColor(red:0.97, green:0.67, blue:0.38, alpha:1).CGColor]
                    break
                case Scorching_CloudyRainy:
                    println("[DEBUG] - Scorching_CloudyRainy")
                    colors = [UIColor(red:0.97, green:0.67, blue:0.38, alpha:1).CGColor, UIColor(red:0.87, green:0.59, blue:0.5, alpha:1).CGColor]
                    break
                case Scorching_Rainy:
                    println("[DEBUG] - Scorching_Rainy")
                    colors = [UIColor(red:0.87, green:0.59, blue:0.5, alpha:1).CGColor]
                    break
                default:
                    println("[ERROR] - No case for this value")
                    break
            }
            
            switch hour {
                case 0..<4:
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen)/2, y: 0.0)
                    break
                case 4..<6:
                    startPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: CGRectGetHeight(boundsScreen))
                    break
                case 6..<9:
                    startPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen)/2)
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: CGRectGetHeight(boundsScreen)/2)
                    break
                case 9..<11:
                    startPoint = CGPoint(x: 0.0, y: 0.0)
                    endPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: CGRectGetHeight(boundsScreen))
                    break
                case 18..<20:
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: 0.0)
                    endPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen))
                    break
                case 20:
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: CGRectGetHeight(boundsScreen)/2)
                    endPoint = CGPoint(x: 0.0, y: CGRectGetHeight(boundsScreen)/2)
                    break
                case 21...23:
                    startPoint = CGPoint(x: CGRectGetWidth(boundsScreen), y: CGRectGetHeight(boundsScreen))
                    endPoint = CGPoint(x: 0.0, y: 0.0)
                    break
                default:
                    println("[ERROR] - Hour isn't included in the given interval")
            }
            
            return (colors, locations, startPoint, endPoint);
            
        }
        
    }
    
}