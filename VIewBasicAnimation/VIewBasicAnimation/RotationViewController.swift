//
//  RotationViewController.swift
//  VIewBasicAnimation
//
//  Created by 賢瑭 何 on 2016/5/28.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var v1: UIImageView!
    @IBOutlet weak var v2: UIImageView!
    @IBOutlet weak var v3: UIImageView!
    @IBOutlet weak var v4: UIImageView!
    @IBOutlet weak var v5: UIImageView!
    @IBOutlet weak var v6: UIImageView!
    @IBOutlet weak var v7: UIImageView!
    @IBOutlet weak var v8: UIImageView!
    @IBOutlet weak var emoji: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        spin()
    }
    
    func spin() {
        let transformMake = CGAffineTransformMakeRotation(CGFloat(M_PI_2))

        UIView.animateWithDuration(1.2, delay: 0.0, options: .CurveLinear, animations: {
            self.emoji.transform = transformMake
            self.emoji.transform = CGAffineTransformRotate(self.emoji.transform, CGFloat(M_PI))
            self.v1.transform = transformMake
            self.v1.transform = CGAffineTransformRotate(self.v1.transform, CGFloat(M_PI))
            self.v2.transform = transformMake
            self.v2.transform = CGAffineTransformRotate(self.v2.transform, CGFloat(M_PI))
            self.v3.transform = transformMake
            self.v3.transform = CGAffineTransformRotate(self.v3.transform, CGFloat(M_PI))
            self.v4.transform = transformMake
            self.v4.transform = CGAffineTransformRotate(self.v4.transform, CGFloat(M_PI))
            self.v5.transform = transformMake
            self.v5.transform = CGAffineTransformRotate(self.v5.transform, CGFloat(M_PI))
            self.v6.transform = transformMake
            self.v6.transform = CGAffineTransformRotate(self.v6.transform, CGFloat(M_PI))
            self.v7.transform = transformMake
            self.v7.transform = CGAffineTransformRotate(self.v7.transform, CGFloat(M_PI))
            self.v8.transform = transformMake
            self.v8.transform = CGAffineTransformRotate(self.v8.transform, CGFloat(M_PI))
            }) { _ in
                self.spin()
        }
        
    }

}
