//
//  FirstTableViewController.swift
//  Animated TableViewCell
//
//  Created by 賢瑭 何 on 2016/5/19.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var data = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    var height: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 65
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
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellName, forIndexPath: indexPath) as UITableViewCell
        let colorDegrees = CGFloat(indexPath.row) * 0.1
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 16)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor(red: colorDegrees, green: 0.0, blue: 1.0, alpha: 1.0)
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        //  Must call it!
        height = tableView.bounds.height
        let cells = tableView.visibleCells
        
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0.0, height!)
        }
        var index: NSTimeInterval = 0
        
        for av in cells {
            UIView.animateWithDuration(1.0, delay: 0.05 * index, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                av.transform = CGAffineTransformIdentity
                }, completion: nil)
            index += 1
        }
    }
    
    struct Constants {
        static let CellName = "FirstCell"
    }

}
