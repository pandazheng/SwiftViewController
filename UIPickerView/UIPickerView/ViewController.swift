//
//  ViewController.swift
//  UIPickerView
//
//  Created by pandazheng on 15/5/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{
    
    @IBOutlet var pickerView : UIPickerView?
    
    var people = ["Sundy","Joe","Tom","Jessica"]
    var friend = ["Cat","Dog","Tiger","Pig","Rat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView?.delegate = self
        pickerView?.dataSource = self
        pickerView?.backgroundColor = UIColor.redColor()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return people.count
        }
        else
        {
            return friend.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0
        {
            return people[row]
        }
        else
        {
            return friend[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

