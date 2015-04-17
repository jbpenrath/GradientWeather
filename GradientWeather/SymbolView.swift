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
    
    init(frame:CGRect, weather: NSDictionary) {
        super.init(frame: frame)
        
        self.weather = weather
        
        setSymbols()
        
    }
    
    
    //MARK: Private Methods
    private func setSymbols() {
        
        var code:Int = (weather.valueForKeyPath("global.code") as! String).toInt()!
        
        switch 21 {
        case 25,31,33,34,36,3200:
            generateSun()
        case 5,6,10...12,35,40,45,47:
            generateRain()
        case 5,7...9,13...18,41...43,46:
            generateSnow()
        case 0...4,23,24,37...39:
            generateWind()
        case 19...22,26...30,44:
            generateCloud()
            break
        default:
            println("Code \(code) unknown.")
            break
        }
    }
    
    private func generateSun() {
        println("Generating Sun...")
        
        symbol = Sun(frame: CGRect(x: self.frame.width/3, y: 20, width: 95, height: 95))
        symbol.backgroundColor = UIColor.redColor()
        self.addSubview(symbol)
        
    }
    
    private func generateRain() {
        println("Generating Rain...")
        let rain = Rain(frame: self.frame)
        self.addSubview(rain)
    }
    
    private func generateSnow() {
        println("Generating Snow...")
    }
    
    private func generateWind() {
        println("Generating Wind...")
        let wind = Wind(frame: self.frame)
        self.layer.addSublayer(wind)
    }
    
    private func generateCloud() {
        println("Generating Cloud...")
        let sky = Sky(frame: self.frame)
        self.layer.addSublayer(sky)
    }
    
}
