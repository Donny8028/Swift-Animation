//
//  ViewController.swift
//  UICollectionViewAnimation
//
//  Created by 賢瑭 何 on 2016/5/25.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    

    
    var image = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? NewsPaperCollectionViewCell
        cell?.imageView.image = image[indexPath.row]
        cell?.textView.text = "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."
        cell?.backButtonView.hidden = true
        cell?.back = {
            guard let index = collectionView.indexPathsForSelectedItems() else{
                return
            }
            collectionView.scrollEnabled = true
            collectionView.reloadItemsAtIndexPaths(index)
        }
        
        return cell!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cellView = collectionView.cellForItemAtIndexPath(indexPath) as? NewsPaperCollectionViewCell
        collectionView.bringSubviewToFront(cellView!)
        collectionView.scrollEnabled = false
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveLinear, animations: {
            cellView!.frame = self.collectionView.bounds
            }) { _ in
                cellView?.backButtonView.hidden = false
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}

