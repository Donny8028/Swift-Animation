//
//  EffectView.swift
//  TumblrMenu
//
//  Created by 賢瑭 何 on 2016/5/23.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit


class EffectView: UIView {
    
    var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = setupView()
        view?.frame = bounds
        addSubview(view!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = setupView()
        view?.frame = bounds
        addSubview(view!)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> UIView? {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "EffectView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as? UIView
        
        return view
    }

}
