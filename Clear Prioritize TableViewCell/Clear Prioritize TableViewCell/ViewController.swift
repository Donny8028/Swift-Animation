//
//  ViewController.swift
//  Clear Prioritize TableViewCell
//
//  Created by 賢瑭 何 on 2016/5/18.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame, style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCell)
        tableView?.separatorStyle = .None
        tableView?.allowsSelection = false
        tableView?.rowHeight = 70
        
        view.addSubview(tableView!)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.tableViewCell, forIndexPath: indexPath) as UITableViewCell
        let colorDegree = CGFloat(indexPath.row) * 0.05
        
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 16)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = UIColor(red: 1.0, green: colorDegree, blue: 0.0, alpha: 1.0)
        
        return cell
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Constants {
       static let tableViewCell = "NewCell"
    }
}

