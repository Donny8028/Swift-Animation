//
//  EffectViewController.swift
//  TumblrMenu
//
//  Created by 賢瑭 何 on 2016/5/23.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {
    
    var effectBackgroundView: UIVisualEffectView?
    var buttonView: EffectView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        effectBackgroundView = UIVisualEffectView()
        let effect = UIBlurEffect(style: .Dark)
        effectBackgroundView?.effect = effect
        effectBackgroundView?.backgroundColor = UIColor(red: 43 / 255, green: 70 / 255, blue: 95 / 255, alpha: 0.4)
        effectBackgroundView?.frame = UIScreen.mainScreen().bounds
        view.insertSubview(effectBackgroundView!, atIndex: 0)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func dismiss() {
        // Unwind segue back
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func goback() {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}