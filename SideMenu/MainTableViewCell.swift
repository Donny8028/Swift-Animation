//
//  MainTableViewCell.swift
//  SideMenu
//
//  Created by 賢瑭 何 on 2016/5/22.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var authorImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var authorName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
