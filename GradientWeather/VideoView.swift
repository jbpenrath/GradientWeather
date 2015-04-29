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
    
    let thumbnailView:UIImageView = UIImageView()
    let moviePlayer:MPMoviePlayerController = MPMoviePlayerController()
    let shapeView:UIView = UIView()
    let bar:CAShapeLayer = CAShapeLayer()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("addThumbnail:"), name: MPMoviePlayerThumbnailImageRequestDidFinishNotification, object: self.moviePlayer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("movieDidFinished:"), name: MPMoviePlayerPlaybackDidFinishNotification, object: self.moviePlayer)
        
        let bundle = NSBundle.mainBundle()
        let moviePath:String! = bundle.pathForResource("Gitano", ofType: "mp4")!
        let movieUrl:NSURL! = NSURL(fileURLWithPath: moviePath)
        
        self.moviePlayer.controlStyle = MPMovieControlStyle.None
        self.moviePlayer.contentURL = movieUrl
        self.moviePlayer.view.frame = self.frame
        self.moviePlayer.shouldAutoplay = false
        
        self.moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
        self.addSubview(moviePlayer.view)
        
        shapeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        shapeView.alpha = 0
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
        
//        let shapeAnimation = CABasicAnimation(keyPath: "transform.scale")
//        shapeAnimation.fromValue = 0.01
//        shapeAnimation.toValue = 1
//        shapeAnimation.duration = 1
//        shapeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//        shapeAnimation.fillMode = kCAFillModeForwards
//        shapeAnimation.removedOnCompletion = false
//        triangle.addAnimation(shapeAnimation, forKey: "Scale")
        
        CSTween.tweenFrom(0.0, to: 1.0, duration: 1.0, timingFunctionName: TweenEaseInOutExpo, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.shapeView.alpha = operation.value
            self.shapeView.transform = CGAffineTransformMakeScale(operation.value, operation.value)
        }, completeBlock: nil)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "launchVideo:")
        tapGesture.delegate = self
        shapeView.addGestureRecognizer(tapGesture)
        
        self.moviePlayer.requestThumbnailImagesAtTimes([NSTimeInterval(0)], timeOption: MPMovieTimeOption.Exact)

        addBar()
    }
    
    func addThumbnail(notification:NSNotification) {
        let image:UIImage = notification.userInfo?[MPMoviePlayerThumbnailImageKey] as! UIImage
        thumbnailView.frame = self.moviePlayer.view.frame
        thumbnailView.image = image
        thumbnailView.contentMode = UIViewContentMode.ScaleAspectFill
        self.moviePlayer.view.addSubview(thumbnailView)
        self.addSubview(shapeView)
    }
    
    func movieDidFinished(notification:NSNotification) {
        let reduceBar = CABasicAnimation(keyPath: "path")
        reduceBar.toValue = UIBezierPath(rect: CGRect(origin: CGPointZero, size: CGSize(width: 20, height: 0.0))).CGPath
        reduceBar.duration = NSTimeInterval(1.5)
        reduceBar.fillMode = kCAFillModeForwards
        reduceBar.removedOnCompletion = false
        
        self.bar.addAnimation(reduceBar, forKey: "Reduce")
        
        let maskView = UIView(frame: self.moviePlayer.view.frame)
        let maskShape:CAShapeLayer = CAShapeLayer()
        maskShape.frame = self.moviePlayer.view.frame
        
        let diameter = sqrt(pow(self.moviePlayer.view.frame.height, 2) + pow(self.moviePlayer.view.frame.width, 2))
        
        let maskPath = UIBezierPath(ovalInRect: CGRect(origin: CGPoint(x: -(diameter-maskShape.frame.width)/2, y: -(diameter-maskShape.frame.height)/2), size: CGSize(width: diameter, height: diameter)))
        maskShape.path = maskPath.CGPath
        maskView.layer.addSublayer(maskShape)
        
        self.moviePlayer.view.maskView = maskView;
        
        CSTween.tweenFrom(1.0, to: 0.0, duration: 1.5, timingFunctionName: TweenEaseInExpo, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.moviePlayer.view.maskView?.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }) { (finished:Bool) -> Void in
                if finished == true {
                    self.bar.removeFromSuperlayer()
                    self.moviePlayer.view.removeFromSuperview()
                }
        }
        
    }
    
    func launchVideo(recognizer:UITapGestureRecognizer) {
        
        self.thumbnailView.removeFromSuperview()
        self.shapeView.userInteractionEnabled = false
        
        CSTween.tweenFrom(1.0, to: 0.25, duration: 0.5, timingFunctionName: TweenEaseInOutExpo, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.shapeView.transform = CGAffineTransformMakeScale(operation.value, operation.value)
            }) { (finished:Bool) -> Void in
                if finished == true {
                    CSTween.tweenFrom(self.shapeView.frame.origin.x, to: 25, duration: 1.0, timingFunctionName: TweenEaseInOutExpo, updateBlock: { (operation:CSTweenOperation!) -> Void in
                            self.shapeView.frame.origin.x = operation.value
                    }, completeBlock: nil)
                    
                    CSTween.tweenFrom(self.shapeView.frame.origin.y, to: 10, duration: 1.0, timingFunctionName: TweenEaseInOutExpo, updateBlock: { (operation:CSTweenOperation!) -> Void in
                            self.shapeView.frame.origin.y = operation.value
                        }, completeBlock: { (finished:Bool) -> Void in
                            self.moviePlayer.play()
                            self.animateBar()
                    })

                }
        }
        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.shapeView.transform = CGAffineTransformMakeScale(0.25, 0.25)
//        }) { (finished) -> Void in
//            if finished {
//                UIView.animateWithDuration(1.0, animations: { () -> Void in
//                    self.shapeView.frame.origin = CGPoint(x: 25, y: 10)
//                }, completion: { (finished) -> Void in
//                    if finished {
//                        self.moviePlayer.play()
//                        self.addBar()
//                    }
//                })
//            }
//        }
    }
    
    func addBar() {
        bar.bounds = CGRect(origin: CGPointZero, size: CGSize(width: 20, height: 0))
        bar.path = UIBezierPath(rect: bar.bounds).CGPath
        bar.fillColor = UIColor(red:0.459, green:0.631, blue:0.62, alpha:1).CGColor
        self.layer.addSublayer(bar)
    }
    
    func animateBar() {
        let animationBar = CABasicAnimation(keyPath: "path")
        animationBar.fromValue = bar.path
        animationBar.toValue = UIBezierPath(rect: CGRect(origin: CGPointZero, size: CGSize(width: 20, height: self.moviePlayer.view.frame.height))).CGPath
        animationBar.duration = self.moviePlayer.duration
        animationBar.fillMode = kCAFillModeForwards
        animationBar.removedOnCompletion = false;
        
        CSTween.tweenFrom(self.shapeView.center.y, to: self.moviePlayer.view.frame.height - self.shapeView.center.y, duration: CGFloat(self.moviePlayer.duration), timingFunctionName: TweenEaseLinear, updateBlock: { (operation:CSTweenOperation!) -> Void in
            self.shapeView.center.y = operation.value
        }, completeBlock: nil)
        
//        UIView.animateWithDuration(self.moviePlayer.duration, animations: { () -> Void in
//            self.shapeView.frame.origin = CGPoint(x: self.shapeView.frame.origin.x, y: self.moviePlayer.view.frame.height - 50)
//        }, completion: nil)
        
        bar.addAnimation(animationBar, forKey: "Increase")
    }
    
    
}
