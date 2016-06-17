//
//  ExploreViewController.swift
//  TabBarSwitch
//
//  Created by 賢瑭 何 on 2016/5/29.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            self.imageView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
}
