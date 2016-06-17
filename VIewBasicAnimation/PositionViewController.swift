//
//  PositionViewController.swift
//  VIewBasicAnimation
//
//  Created by 賢瑭 何 on 2016/5/28.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

    @IBOutlet weak var letf: UIView!
    @IBOutlet weak var right: UIView!
    @IBOutlet weak var mouse: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: { () -> Void in
            self.letf.center.x = self.letf.superview!.bounds.width - self.letf.center.x
            self.letf.center.y = self.letf.center.y + 30
            self.right.center.x = self.view.bounds.width -  self.right.center.x
            self.right.center.y = self.right.center.y + 30
        }, completion: nil )
        
        var frame: CGRect = self.mouse.frame
        frame.size.height = 180
        
        UIView.animateWithDuration(0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseOut, animations: { () -> Void in
            self.mouse.frame = frame
            self.mouse.center.y = self.view.bounds.height - self.mouse.center.y
        }, completion: nil )
    }
}
