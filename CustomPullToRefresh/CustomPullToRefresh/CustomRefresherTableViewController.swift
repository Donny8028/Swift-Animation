//
//  CustomRefresherTableViewController.swift
//  CustomPullToRefresh
//
//  Created by 賢瑭 何 on 2016/5/25.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class CustomRefresherTableViewController: UITableViewController {

    var refresher: UIRefreshControl?
    var views = [UILabel]()
    var index: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        let nib = UINib(nibName: "CustomRefreshView", bundle: nil)
        let refreshView = nib.instantiateWithOwner(nil, options: nil).first as? UIView
        refresher = UIRefreshControl()
        refresher?.addTarget(self, action: #selector(self.refresh), forControlEvents: .ValueChanged)
        refresher?.addSubview(refreshView!)
        refreshView?.frame = refresher!.frame
        
        self.refreshControl = refresher
        
        for i in 1...5 {
            let view = refreshView!.viewWithTag(i)
            if let label = view as? UILabel {
                views.append(label)
                assert(!views.isEmpty, "views is empty")
            }
        }
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
        return 5
    }
    
    var tag = 0
    
    func refresh() {
        if !views.isEmpty {
            UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveLinear, animations: {
                self.views[self.tag].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                self.views[self.tag].textColor = self.getColor()
                }, completion:{ _ in
                    
                UIView.animateWithDuration(0.05, delay: 0.0, options: .CurveLinear, animations: {
                    self.views[self.tag].transform = CGAffineTransformIdentity
                    self.views[self.tag].textColor = UIColor.blackColor()
                    }, completion: { _ in
                    guard self.refresher!.refreshing else{
                        self.tag = 0
                        return
                    }
                    self.tag += 1
                        if self.tag < self.views.count{
                            self.refresh()
                        }else{
                        self.tag = 0
                        self.scaleAnimation()
                    }
                })
            })
        }
    }
    
    func scaleAnimation() {
        for i in 0...views.count-1 {
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveLinear, animations: {
                self.views[i].transform = CGAffineTransformMakeScale(1.5, 1.5)
                }, completion: { (bool) in
                    self.views[i].transform = CGAffineTransformIdentity
                    if i == self.views.count-1 {
                        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5*Double(NSEC_PER_SEC)))
                        dispatch_after(time, dispatch_get_main_queue(), { 
                            self.refresh()
                    })
                }
            })
        }
    }
    
    func getColor() -> UIColor {
        let colors = [UIColor.blueColor(),UIColor.brownColor(),UIColor.grayColor(),UIColor.greenColor(),UIColor.yellowColor(),UIColor.orangeColor(),UIColor.redColor()]
        index = (index + 1) % 7
        let color = colors[index]
        
        return color
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let num = ["one","two","three","four","five"]
        
        cell.textLabel?.text = num[indexPath.row]
        
        return cell
    }
}
