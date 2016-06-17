//
//  TableViewController.swift
//  SwipeableCell
//
//  Created by 賢瑭 何 on 2016/5/26.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data = [
        Pattern(image: "1", name: "Pattern Building"),
        Pattern(image: "2", name: "Joe Beez"),
        Pattern(image: "3", name: "Car It's car"),
        Pattern(image: "4", name: "Floral Kaleidoscopic"),
        Pattern(image: "5", name: "Sprinkle Pattern"),
        Pattern(image: "6", name: "Palitos de queso"),
        Pattern(image: "7", name: "Ready to Go? Pattern"),
        Pattern(image: "8", name: "Sets Seamless"),
        ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? PatternTableViewCell
        
        let info = data[indexPath.row]
        cell?.imageContainer.image = UIImage(named: info.image)
        cell?.subject.text = info.name

        return cell!
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let download = UITableViewRowAction(style: .Normal, title: "Download") { (_, _) in
            print("Preparing for download")
        }
        let share = UITableViewRowAction(style: .Normal, title: "Share") { (action, indexPath) in
            let activityVC = UIActivityViewController(activityItems: [self.data[indexPath.row].name], applicationActivities: nil)
            
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Delete") { (action, indexPath) in
            print("sure to delete")
        }
        
        return [delete,share,download]
    }

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.beginUpdates()
            data.removeAtIndex(indexPath.row)
            tableView.endUpdates()
        }else{
            return
        }
    }
}
