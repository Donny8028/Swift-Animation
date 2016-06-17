//
//  ViewController.swift
//  Video Background
//
//  Created by 賢瑭 何 on 2016/5/17.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    let avViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 5
        signUp.layer.cornerRadius = 5
        view.insertSubview(avViewController.view, atIndex: 0)
        setVideo()
        avViewController.player?.play()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addObserver()
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(observer!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setVideo() {
        let url = NSBundle.mainBundle().URLForResource("moments", withExtension: "mp4")
        let player = AVPlayer(URL: url!)
        avViewController.player = player
        avViewController.view.frame = view.frame
        avViewController.videoGravity = AVLayerVideoGravityResizeAspectFill
        avViewController.showsPlaybackControls = false
    }
    
    var observer: NSObjectProtocol?
    
    func addObserver() {
     observer = NSNotificationCenter.defaultCenter().addObserverForName(AVPlayerItemDidPlayToEndTimeNotification, object: avViewController.player?.currentItem, queue: NSOperationQueue.mainQueue(), usingBlock: { notification in
        self.avViewController.player?.seekToTime(kCMTimeZero)
        // 要重播同一影片必須要先用此方法回到影片播放最初秒數
        self.avViewController.player?.play()
     })
    }

}

