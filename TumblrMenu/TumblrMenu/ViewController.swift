//
//  ViewController.swift
//  TumblrMenu
//
//  Created by 賢瑭 何 on 2016/5/23.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let effectViewController = EffectViewController()
    let animationManager = AnimationManager()
    
    @IBAction func newPost() {
        
        presentViewController(effectViewController, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        effectViewController.transitioningDelegate = animationManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

