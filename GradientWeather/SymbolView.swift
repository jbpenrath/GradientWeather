//
//  SymbolView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 17/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit

class SymbolView:UIView, UIGestureRecognizerDelegate {
    
    var weather:NSDictionary! = NSDictionary()
    var symbol:UIView!
    
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    init(frame:CGRect, weather: NSDictionary?) {
        super.init(frame: frame)
        
        self.weather = weather
        
        setSymbols()
        
    }
    
    
    //MARK: Private Methods
    private func setSymbols() {
        
        var code:Int
        if weather != nil {
            code = (weather.valueForKeyPath("global.code") as! String).toInt()!
        } else {
            code = 6
        }
        
        switch code {
        case 25,31,33,34,36,3200:
            generateSun()
            break
        case 5,6,10...12,35,40,45,47:
            generateRain()
            break
        case 5,7...9,13...18,41...43,46:
            generateSnow()
            break
        case 0...4,23,24,37...39:
            generateWind()
            break
        case 19...22,26...30,44:
            generateCloud()
            break
        default:
            println("[ERROR] Code \(code) unknown.")
            break
        }
    }
    
    private func generateSun() {
        println("[DEBUG] Generating Sun...")
        
        symbol = Sun(frame: CGRect(x: self.frame.width/3, y: 20, width: 95, height: 95))
        symbol.backgroundColor = UIColor.redColor()
        self.addSubview(symbol)
        
    }
    
    private func generateRain() {
        println("[DEBUG] Generating Rain...")
        let rain = Rain(frame: self.frame)
        self.addSubview(rain)
    }
    
    private func generateSnow() {
        println("[DEBUG] Generating Snow...")
    }
    
    private func generateWind() {
        println("[DEBUG] Generating Wind...")
        let wind = Wind(frame: self.frame)
        self.addSubview(wind)
    }
    
    private func generateCloud() {
        println("[DEBUG] Generating Cloud...")
        let sky = Sky(frame: self.frame)
        self.addSubview(sky)
    }
    
}
