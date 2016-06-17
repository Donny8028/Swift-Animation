//
//  PatternTableViewCell.swift
//  SwipeableCell
//
//  Created by 賢瑭 何 on 2016/5/26.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

struct Pattern {
    let image: String
    let name: String
}

class PatternTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var subject: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
