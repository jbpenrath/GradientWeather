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
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
        self.addSubview(moviePlayer.view)
        
        shapeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        shapeView.center = self.center
        
        let triangle = CAShapeLayer()
        triangle.frame = CGRect(origin: CGPointZero, size: shapeView.frame.size)
        var trianglePath = CGPathCreateMutable()
        CGPathMoveToPoint(trianglePath, nil, 0, 0)
        CGPathAddLineToPoint(trianglePath, nil, 0, 100)
        CGPathAddLineToPoint(trianglePath, nil, 100, 0)
        CGPathAddLineToPoint(trianglePath, nil, 0, 0)
        triangle.path = trianglePath
        triangle.fillColor = UIColor(red:0.459, green:0.631, blue:0.62, alpha:1).CGColor
        shapeView.layer.addSublayer(triangle)
        
        let shapeAnimation = CABasicAnimation(keyPath: "transform.scale")
        shapeAnimation.fromValue = 0.01
        shapeAnimation.toValue = 1
        shapeAnimation.duration = 1
        shapeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        shapeAnimation.fillMode = kCAFillModeForwards
        shapeAnimation.removedOnCompletion = false
        triangle.addAnimation(shapeAnimation, forKey: "Scale")
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "launchVideo:")
        tapGesture.delegate = self
        shapeView.addGestureRecognizer(tapGesture)
        
        self.moviePlayer.requestThumbnailImagesAtTimes([0], timeOption: MPMovieTimeOption.NearestKeyFrame)
        
        self.addSubview(shapeView)
        
    }
    
    func launchVideo(recognizer:UITapGestureRecognizer) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.shapeView.transform = CGAffineTransformMakeScale(0.25, 0.25)
        }) { (finished) -> Void in
            if finished {
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.shapeView.frame.origin = CGPoint(x: 25, y: 10)
                }, completion: { (finished) -> Void in
                    if finished {
                        self.moviePlayer.play()
                        self.addBar()
                    }
                })
            }
        }
    }
    
    func addBar() {
        let bar = CAShapeLayer();
        bar.bounds = CGRect(origin: CGPointZero, size: CGSize(width: 20, height: 0))
        bar.path = UIBezierPath(rect: bar.bounds).CGPath
        bar.fillColor = UIColor(red:0.459, green:0.631, blue:0.62, alpha:1).CGColor
        self.moviePlayer.view.layer.addSublayer(bar)
        
        let animationBar = CABasicAnimation(keyPath: "path")
        animationBar.fromValue = bar.path
        animationBar.toValue = UIBezierPath(rect: CGRect(origin: CGPointZero, size: CGSize(width: 20, height: 200))).CGPath
        animationBar.duration = self.moviePlayer.duration
        animationBar.fillMode = kCAFillModeForwards
        animationBar.removedOnCompletion = false;
        
        UIView.animateWithDuration(self.moviePlayer.duration, animations: { () -> Void in
            self.shapeView.frame.origin = CGPoint(x: self.shapeView.frame.origin.x, y: self.frame.height)
        }, completion: nil)
        
        bar.addAnimation(animationBar, forKey: "Increase")
    }
    
    
}
