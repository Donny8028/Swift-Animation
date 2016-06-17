//
//  ViewController.swift
//  Carousel Effect
//
//  Created by 賢瑭 何 on 2016/5/15.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cool Cell"


class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items: [CoolImage] = [
                                      CoolImage(image: "bodyline", caption: "you know I like it"),
                                      CoolImage(image: "darkvarder", caption: "winter is coming"),
                                      CoolImage(image: "dudu", caption: "waiting till the end of the day"),
                                      CoolImage(image: "hello", caption: "trick or treat"),
                                      CoolImage(image: "hhhhh", caption: "pain in the neck"),
                                      CoolImage(image: "run", caption: "don't let me find you"),
                                      CoolImage(image: "wave", caption: "just shining")
                                    ]
    
    var layout: UICollectionViewLayout?
    var reuseView: UICollectionReusableView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // you don't need register when you already set the cell in storyBoard
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CoolImageCollectionViewCell
        let item = items[indexPath.row]
        // items[index.item] is legal as well
        cell?.caption.text = item.caption
        cell?.imagView.image = UIImage(named: item.image)
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

