//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by 賢瑭 何 on 2016/5/19.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameCenterX: NSLayoutConstraint!
    @IBOutlet weak var passwordCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func backButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func Login() {
        let bounds = self.login.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {
            self.login.bounds = CGRect(x: bounds.origin.x - 20, y: 0, width: bounds.width + CGFloat(60), height: bounds.height)
            self.login.enabled = false
            }) { (complete) in
                self.login.bounds = bounds
                self.login.enabled = true
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        userNameCenterX.constant += view.bounds.width
        passwordCenterX.constant += view.bounds.width
        login.alpha = 0.0
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.userNameCenterX.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(1.0, delay: 0.2, options: .CurveEaseOut, animations: { 
            self.passwordCenterX.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(1.0, delay: 0.8, options: .CurveEaseOut, animations: {
            self.login.alpha = 1.0
            }, completion: nil)
        
//        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
//            self.userNameCenterX.constant -= self.view.bounds.width
//            self.view.layoutIfNeeded()
//            UIView.animateWithDuration(1.0, delay: 0.2, options: .CurveEaseOut, animations: {
//                 self.passwordCenterX.constant -= self.view.bounds.width
//                self.view.layoutIfNeeded()
//                }, completion: nil)
//            UIView.animateWithDuration(1.0, delay: 0.8, options: .CurveEaseOut, animations: {
//                self.login.alpha = 1.0
//                self.view.layoutIfNeeded()
//                }, completion: nil)
//            }, completion: nil)
        
        // Nest would work, but not that smooth visually.
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.cornerRadius = 5.0
        login.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
