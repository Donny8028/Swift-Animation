//
//  ViewController.swift
//  SideMenu
//
//  Created by 賢瑭 何 on 2016/5/22.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    var transitionManager = AnimationManager()
    
    var userData = [Users(name: "Allen Wang", title: "Love mountain.", imageName: "a", backgoundView: "1"),
                    Users(name: "Cole", title: "New graphic design - LIVE FREE", imageName: "b", backgoundView: "2"),
                    Users(name: "Daniel Hooper", title: "Summer sand", imageName: "c", backgoundView: "3"),
                    Users(name: "Noby-Wan Kenobi", title: "Seeking for signal", imageName: "d", backgoundView: "4"),
                    Users(name: "Donny Ho", title: "Look at me", imageName: "e", backgoundView: "5")
                    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Everyday Moments"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as? MainTableViewCell
        let info = userData[indexPath.row]
        
        cell?.authorName.text = info.name
        cell?.title.text = info.title
        cell?.authorImage.image = UIImage(named: info.imageName)
        cell?.backgroundImage.image = UIImage(named: info.backgoundView)
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowMenu" {
            if let destinationViewController = segue.destinationViewController as? MenuViewController {
                destinationViewController.transitioningDelegate = transitionManager
                transitionManager.delegate = destinationViewController
                destinationViewController.currentItem = self.title!
            }
        }
    }
    
    @IBAction func goback(segue: UIStoryboardSegue) {
        if segue.identifier == "ShowMain" {
           if let sourceViewController = segue.sourceViewController as? MenuViewController {
               self.title = sourceViewController.currentItem
            }
        }
    }

}

