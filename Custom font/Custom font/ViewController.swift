//
//  ViewController.swift
//  Custom font
//
//  Created by 賢瑭 何 on 2016/5/11.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let buttonWidth: CGFloat = 50
        static let buttonHeight: CGFloat = 50
        static let buttonTitle = "Change Font"
        static let buttonTitleSize: CGFloat = 16
    }
    
    private var fonts: [UIFont]?
    var index:Int = 0
    
    
    @IBOutlet weak var textView: UITextView! {
        didSet{
            
            textView.text = "\n \n積陰德 \n \n 扶老人過馬路 \n \n 積陰德 \n \n 幫正妹過馬路 \n \n 積積陰陰德 \n\n\n\n節錄自 -- 飲冰室茶集"
            textView.backgroundColor = UIColor.blackColor()
        }
    }
    
    @IBOutlet weak var buttonView: DrawPathView!
    
    var roundButton: UIButton? {
        didSet{
            
            roundButton?.titleLabel?.textColor = UIColor.blackColor()
            roundButton?.setTitle(Constants.buttonTitle, forState: .Normal)
            roundButton?.titleLabel?.font = UIFont.systemFontOfSize(Constants.buttonTitleSize)
            roundButton?.sizeToFit()
            roundButton?.addTarget(self, action: #selector(self.updateFont), forControlEvents: .TouchUpInside)
        }
    }
    
    var buttonSize:CGSize {
        
        let size = view.bounds.size.width / CGFloat(4)
        return CGSize(width: size , height: size)
    }
    
    //Get the custom fonts
    //Remember to remove the extension file name
    func getFontsName() {
        
        var customFonts = [UIFont]()
        var systemFonts = [UIFont]()
        
        let fonts = UIFont.familyNames()
        for font in fonts {
            for customFont in UIFont.fontNamesForFamilyName(font) {
                if let _ = textView {
                    switch customFont {
                    case "Gaspar Regular" :
                        let x = UIFont(name: customFont, size: Constants.buttonTitleSize)
                        customFonts.append(x!)
                    case "MFJinHei_Noncommercial-Regular" :
                        let x = UIFont(name: customFont, size: Constants.buttonTitleSize)
                        customFonts.append(x!)
                    case "MFTongXin_Noncommercial-Regular" :
                        let x = UIFont(name: customFont, size: Constants.buttonTitleSize)
                        customFonts.append(x!)
                    case "MFZhiHei_Noncommercial-Regular" :
                        let x = UIFont(name: customFont, size: Constants.buttonTitleSize)
                        customFonts.append(x!)
                    default :
                        if systemFonts.count <= 10 {
                            let x = UIFont(name: customFont, size: Constants.buttonTitleSize)
                            systemFonts.append(x!)
                        }else{
                            break
                        }
                    }
                }
            }
        }
        if !customFonts.isEmpty {
            self.fonts = customFonts
        }else {
            self.fonts = systemFonts
        }
    }
    
    func updateFont() {
        
        if let fonts = fonts {
            var forOneTime = true
            while forOneTime && index < fonts.count {
                if let tv = textView {
                    tv.font = fonts[index]
                    index += 1
                    forOneTime = !forOneTime
                }else{
                    forOneTime = !forOneTime
                    return
                }
            }
            if index == fonts.count {
                index = 0
            }
        }
    }
    
    func createCircle() {
        
        if let button = roundButton {
            let circleOrigin = CGPoint(x: buttonView.bounds.midX - button.bounds.size.width/2, y: buttonView.bounds.midY - button.bounds.size.width/2)
            let circle = UIBezierPath(ovalInRect: CGRect(origin: circleOrigin, size: buttonSize))
            buttonView.addToDrawPath("Circle", path: circle)
            
            
        }
    }
    
    
    func createButton() {
        
        roundButton = UIButton(type: .Custom)
        // If you want to custom the touch effect, set Custom
        let attributedFont = NSAttributedString(string: Constants.buttonTitle, attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        roundButton?.setAttributedTitle(attributedFont, forState: .Normal)
        roundButton?.showsTouchWhenHighlighted = true
        roundButton?.contentMode = .Right
        buttonView?.addSubview(roundButton!)
        buttonView?.bringSubviewToFront(roundButton!)
    }
    //Alternative option: use property "layer.cornerRadius" for round button

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Custom Font"
        createButton()
        getFontsName()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let boundsHeight = view.bounds.size.height / 4
        buttonView.bounds.size.height = boundsHeight
        buttonView.frame.origin.y = view.bounds.maxY - boundsHeight
        textView.bounds.size.height = boundsHeight * 3 + 40
        textView.frame.origin.y = view.bounds.minY
        roundButton?.center.x = buttonView.bounds.midX
        roundButton?.center.y = buttonView.bounds.midY
        createCircle()
        roundButton!.transform = CGAffineTransformMakeTranslation(5, 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

