//
//  VideoView.swift
//  GradientWeather
//
//  Created by Jean-baptiste PENRATH on 15/04/2015.
//  Copyright (c) 2015 Jean-baptiste PENRATH. All rights reserved.
//

import UIKit
import MediaPlayer

class VideoView:UIView, UIGestureRecognizerDelegate {
    
    let moviePlayer:MPMoviePlayerController = MPMoviePlayerController()
    let shapeView:UIView = UIView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        let bundle = NSBundle.mainBundle()
        let moviePath:String! = bundle.pathForResource("Gitano", ofType: "mp4")!
        let movieUrl:NSURL! = NSURL(fileURLWithPath: moviePath)
        
        self.moviePlayer.controlStyle = MPMovieControlStyle.None
        self.moviePlayer.contentURL = movieUrl
        moviePlayer.view.frame = self.frame
        moviePlayer.fullscreen = true
        self.addSubview(moviePlayer.view)
        
        shapeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        shapeView.center = self.center
        
        let circle = CAShapeLayer()
        circle.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        circle.path = UIBezierPath(ovalInRect: circle.frame).CGPath
        circle.fillColor = UIColor(red:0.99, green:0.31, blue:0.32, alpha:1).CGColor
        shapeView.layer.addSublayer(circle)
        
        let shapeAnimation = CABasicAnimation(keyPath: "transform.scale")
        shapeAnimation.toValue = 100
        shapeAnimation.duration = 1
        shapeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        shapeAnimation.fillMode = kCAFillModeForwards
        shapeAnimation.removedOnCompletion = false
        circle.addAnimation(shapeAnimation, forKey: "Scale")
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "launchVideo:")
        tapGesture.delegate = self
        shapeView.addGestureRecognizer(tapGesture)
        
        self.addSubview(shapeView)
        
    }
    
    func launchVideo(recognizer:UITapGestureRecognizer) {
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.toValue = 0
        fadeOut.duration = 0.5
        fadeOut.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        fadeOut.fillMode = kCAFillModeForwards
        fadeOut.removedOnCompletion = false
        
        shapeView.layer.addAnimation(fadeOut, forKey: "fadeOut")
        moviePlayer.play()
        
    }
    
    
}
