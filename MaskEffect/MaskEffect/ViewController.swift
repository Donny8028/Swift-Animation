//
//  ViewController.swift
//  MaskEffect
//
//  Created by 賢瑭 何 on 2016/6/12.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mask: CALayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImg = UIImageView(frame: view.bounds)
        let foregroundImg = UIImageView(frame: view.bounds)
        
        let image = UIImage(named: "background")
        let maskImg = UIImage(named: "mask")
        
        let width = image?.size.width
        let height = image?.size.height
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
    
        let context = CGBitmapContextCreate(nil, Int(width!), Int(height!), 8, 0, colorSpace, CGBitmapInfo.ByteOrderDefault.rawValue)
        
        if let cont = context {
            let rect = CGRect(x: 0.0, y: 0.0, width: width!, height: height!)
            CGContextDrawImage(cont, rect, image?.CGImage)
            let image = CGBitmapContextCreateImage(cont)
            let grayImage = UIImage(CGImage: image!)
            backgroundImg.image = grayImage
            view.addSubview(backgroundImg)
        }
        
        mask = CALayer()
        mask?.frame.size = maskImg!.size
        mask?.contents = maskImg?.CGImage
        mask?.position = view.center
        foregroundImg.layer.mask = mask
        
        foregroundImg.image = image
        view.addSubview(foregroundImg)
        
        let movingView = UIView(frame: mask!.frame)
        movingView.center = view.center
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panMaskView(_:)))
        movingView.addGestureRecognizer(pan)
        
        view.addSubview(movingView)
    }
    
    func panMaskView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translationInView(view)
        let translationX = translation.x
        let translationY = translation.y
        
        gesture.view?.center = CGPoint(x: gesture.view!.center.x + translationX, y: gesture.view!.center.y + translationY)
        gesture.setTranslation(CGPoint(x: 0.0,y: 0.0) , inView: view)
        
        CATransaction.setDisableActions(true)
        mask?.position = gesture.view!.center
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

