//
//  NewsPaperCollectionViewCell.swift
//  UICollectionViewAnimation
//
//  Created by 賢瑭 何 on 2016/5/25.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class NewsPaperCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backButtonView: UIButton!
    
    var back: (() -> Void)?
    
    @IBAction func backButton() {
        if back != nil {
            back!()
        }
    }
}
