//
//  DrawPathView.swift
//  Custom font
//
//  Created by 賢瑭 何 on 2016/5/12.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class DrawPathView: UIView {
    var drawPaths = [String:UIBezierPath]()
    
    func addToDrawPath(name:String, path: UIBezierPath) {
        drawPaths[name] = path
        setNeedsDisplay()
        
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in drawPaths {
            UIColor.yellowColor().setFill()
            path.fill()
        }
    }
}