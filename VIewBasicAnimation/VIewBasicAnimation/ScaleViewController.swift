//
//  ScaleViewController.swift
//  VIewBasicAnimation
//
//  Created by 賢瑭 何 on 2016/5/28.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        imageView.alpha = 0.0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 20, 20)
            self.imageView.alpha = 1.0
            }, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
