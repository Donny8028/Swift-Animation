//
//  FriendReadViewController.swift
//  TabBarSwitch
//
//  Created by 賢瑭 何 on 2016/5/29.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class FriendReadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [
        
        article(avatarImage: "allen", sharedName: "Allen Wang", actionType: "Read Later", articleTitle: "Giphy Cam Lets You Create And Share Homemade Gifs", articleCoverImage: "giphy", articleSource: "TheNextWeb", articleTime: "5min  •  13:20"),
        article(avatarImage: "Daniel Hooper", sharedName: "Daniel Hooper", actionType: "Shared on Twitter", articleTitle: "Principle. The Sketch of Prototyping Tools", articleCoverImage: "my workflow flow", articleSource: "SketchTalk", articleTime: "3min  •  12:57"),
        article(avatarImage: "davidbeckham", sharedName: "David Beckham", actionType: "Shared on Facebook", articleTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC", articleCoverImage: "Ohlala", articleSource: "TechCrunch", articleTime: "1min  •  12:59"),
        article(avatarImage: "bruce", sharedName: "Bruce Fan", actionType: "Shared on Weibo", articleTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro", articleCoverImage: "Lonely Planet", articleSource: "36Kr", articleTime: "5min  •  11:21"),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? FriendReadTableViewCell
        let info = data[indexPath.row]
        cell?.profileView.image = UIImage(named: info.avatarImage)
        cell?.friendName.text = info.sharedName
        cell?.newsCaption.text = info.articleTitle
        cell?.newsThumbnail.image = UIImage(named: info.articleCoverImage)
        cell?.timeStamp.text = info.articleTime
        cell?.pressName.text = info.articleSource
        
        return cell!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0, view.bounds.height)
        }
        var index = 0.0
        for cell in cells {
            UIView.animateWithDuration(0.8, delay: (0.1) * index, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
                cell.transform = CGAffineTransformIdentity
                index += 1
                }, completion: { _ in
                    index = 0.0
            })
        }
    }

}
