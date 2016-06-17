//
//  MenuViewController.swift
//  SideMenu
//
//  Created by 賢瑭 何 on 2016/5/22.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AnimationManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let menu = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    
    var currentItem = "Everyday Moments"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = menu[indexPath.row]
        cell.textLabel?.textColor = (menu[indexPath.row] == currentItem) ? UIColor.whiteColor() : UIColor.grayColor()
        
        return cell
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowMain" {
            if segue.sourceViewController is MenuViewController{
                let index = tableView.indexPathForSelectedRow
                currentItem = menu[index!.row]
                print("1")
            }
        }
    }
}
