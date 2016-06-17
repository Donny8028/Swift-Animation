//
//  ViewController.swift
//  Animated Splash
//
//  Created by 賢瑭 何 on 2016/5/20.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screenView: UIImageView!
    var mask: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.643, blue: 0.961, alpha: 1)
        let maskImage = UIImage(named: "twitter")
        mask = CALayer()
        mask!.frame = CGRect(x: 0.0, y: 0.0, width: 75, height: 60)
        mask!.position = view.center
        mask!.contents = maskImage!.CGImage
        mask!.contentsGravity = kCAGravityResizeAspect
        screenView.layer.mask = mask
        animation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animation() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        let first = NSValue(CGRect: mask!.bounds)
        let second = NSValue(CGRect: CGRect(x: 0.0, y: 0.0, width: 65, height: 50))
        let third = NSValue(CGRect: CGRect(x: 0.0, y: 0.0, width: 2000, height: 1800))
        keyFrameAnimation.values = [first, second, third]
        keyFrameAnimation.keyTimes = [0, 0.2, 1.0]
        mask?.addAnimation(keyFrameAnimation, forKey: "bounds")
        
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        screenView.layer.mask = nil
    }
}

