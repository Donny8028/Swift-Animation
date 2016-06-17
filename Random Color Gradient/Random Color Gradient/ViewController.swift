//
//  ViewController.swift
//  Random Color Gradient
//
//  Created by 賢瑭 何 on 2016/5/16.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    var toplayer: CALayer = CALayer()
    var randomColor = UIColor()
    var initialBackgroundColor: UIColor?
    var timer: NSTimer?
    var audioPlayer: AVAudioPlayer?

    @IBOutlet weak var buttonView: UIButton!

    @IBOutlet weak var layoutView: UIView!
    
    
    @IBAction func startPlay() {
        
        if audioPlayer != nil {
            layoutView.layer.addSublayer(gradientLayer)
            layoutView.layer.addSublayer(toplayer)
            layoutView.bringSubviewToFront(buttonView)
            
            if timer?.valid == false || timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(self.configureColor), userInfo: nil, repeats: true)
            }
            
            audioPlayer?.play()
            // For advanced setting, look to AVAudioSession
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getMusic()
        toplayer.frame = view.frame
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.blueColor().CGColor, UIColor.purpleColor().CGColor, UIColor.cyanColor().CGColor, UIColor.blueColor().CGColor, UIColor.grayColor().CGColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        initialBackgroundColor = UIColor(red: 0.129, green: 0.0, blue: 0.392, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMusic() {
        do {
            let url = NSBundle.mainBundle().URLForResource("Ecstasy", withExtension: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOfURL: url!)
        }
        catch let x as NSError{
            print("\(x.localizedDescription)")
        }
        audioPlayer?.prepareToPlay()
    }
    
    
    func configureColor() {
        
        randomColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: CGFloat(drand48()))
        toplayer.backgroundColor = randomColor.CGColor
        if audioPlayer?.playing == false {
            gradientLayer.removeFromSuperlayer()
            toplayer.removeFromSuperlayer()
            layoutView.backgroundColor = initialBackgroundColor
            timer?.invalidate()
        }
    }

}
// Alternative way is use CABasicAnimation

