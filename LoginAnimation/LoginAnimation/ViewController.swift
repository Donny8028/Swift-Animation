//
//  ViewController.swift
//  LoginAnimation
//
//  Created by 賢瑭 何 on 2016/5/19.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var signUp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        Login.layer.cornerRadius = 5.0
        signUp.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

