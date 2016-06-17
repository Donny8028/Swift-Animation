//
//  MyTableViewCell.swift
//  Pull to Refresh and Load Data
//
//  Created by 賢瑭 何 on 2016/5/15.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var emoji: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
