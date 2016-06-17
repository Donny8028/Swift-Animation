//
//  CoolImageCollectionViewCell.swift
//  Carousel Effect
//
//  Created by 賢瑭 何 on 2016/5/15.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

struct CoolImage {
    let image:String
    let caption:String
}

class CoolImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagView: UIImageView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var caption: UILabel!
    
}
