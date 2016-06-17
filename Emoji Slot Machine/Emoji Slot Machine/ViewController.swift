//
//  ViewController.swift
//  Emoji Slot Machine
//
//  Created by 賢瑭 何 on 2016/5/19.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let emojis = ["😂","😎","😡","😱","💩","👽","👀","🐷","🐨","🐣","🙉","🐶","🐯"]
    var leftRow = [Int]()
    var midRow = [Int]()
    var rightRow = [Int]()
    
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var mid: UIPickerView!
    @IBAction func start() {
        var fixedRow: Int?
        for i in 0...2 {
        let row = arc4random_uniform(99)
        mid.selectRow(Int(row), inComponent: i, animated: true)
        fixedRow = Int(row)
        }
        if let row = fixedRow where leftRow[row] == midRow[row] && midRow[row] == rightRow[row] {
            let alert = UIAlertController(title: "Bingo!", message: "Congrats!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mid.dataSource = self
        mid.delegate = self
        buttonView.layer.cornerRadius = 6
        for _ in 0...100 {
            let left = arc4random_uniform(13)
            let mid = arc4random_uniform(13)
            let right = arc4random_uniform(13)

            leftRow.append(Int(left))
            midRow.append(Int(mid))
            rightRow.append(Int(right))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        switch component {
        case 0 :
            var left = [String]()
            let view = UILabel()
            view.font = UIFont.systemFontOfSize(50)
            for i in leftRow {
                left.append(emojis[i])
            }
            view.text = left[row]
            
            return view
        case 1 :
            var mid = [String]()
            let view = UILabel()
            view.font = UIFont.systemFontOfSize(50)
            for i in midRow {
                mid.append(emojis[i])
            }
            view.text = mid[row]
            return view
        case 2 :
            var right = [String]()
            let view = UILabel()
            view.font = UIFont.systemFontOfSize(50)
            for i in rightRow {
                right.append(emojis[i])
            }
            view.text = right[row]
            return view
        default:
            let view = UILabel()
            return view
        }
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 100
    }

}

