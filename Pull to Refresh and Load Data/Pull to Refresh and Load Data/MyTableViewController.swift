//
//  MyTableViewController.swift
//  Pull to Refresh and Load Data
//
//  Created by 賢瑭 何 on 2016/5/15.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var emojis = ["💩💩💩💩💩💩","👽👽👽👽👽👽","👻👻👻👻👻👻","🙈🙈🙈🙈🙈🙈"]
    
    var newEmojis = ["😈😈😈😈😈😈","🤕🤕🤕🤕🤕🤕","🤒🤒🤒🤒🤒🤒"]
    

    @IBAction func refresh(sender: UIRefreshControl) {
        sender.beginRefreshing()
        if !newEmojis.isEmpty {
            let emoji = newEmojis.removeFirst()
            emojis.insert(emoji, atIndex: 0)
            tableView.reloadData()
        }else{
            sender.endRefreshing()
        }
        sender.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.blackColor()
        tableView.separatorStyle = .None
        let font = UIFont(name: "Avenir Next", size: 14)
        let attributeText = NSAttributedString(string: "pull down for more emoji", attributes: [NSFontAttributeName:font!, NSForegroundColorAttributeName:UIColor.yellowColor()])
        refreshControl?.attributedTitle = attributeText
        refresh(refreshControl!)
        
        // you needs to call it manually if you set custom text in fresher,which was set through storyboard.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as? MyTableViewCell
        
        let emoji = emojis[indexPath.row]
        cell?.emoji.text = emoji
        cell?.backgroundColor = UIColor.blackColor()
        
        return cell!
    }
}
