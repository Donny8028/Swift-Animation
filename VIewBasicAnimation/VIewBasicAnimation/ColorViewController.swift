//
//  ColorViewController.swift
//  VIewBasicAnimation
//
//  Created by 賢瑭 何 on 2016/5/28.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        text.textColor = UIColor(red: 244/255, green: 241/255, blue: 0.0, alpha: 1)
        UIView.animateWithDuration(0.6, delay: 0.3, options: .CurveEaseIn, animations: {
            self.colorView.backgroundColor = UIColor.blackColor()
            
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
