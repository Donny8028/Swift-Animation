//
//  OpacityViewController.swift
//  VIewBasicAnimation
//
//  Created by 賢瑭 何 on 2016/5/28.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {
    
    @IBOutlet weak var opacityView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(3.0) { 
            self.opacityView.alpha = 0.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
