//
//  FriendReadTableViewCell.swift
//  TabBarSwitch
//
//  Created by 賢瑭 何 on 2016/5/29.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class FriendReadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    
    @IBOutlet weak var newsCaption: UILabel!
    @IBOutlet weak var newsThumbnail: UIImageView!
    
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var pressName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
