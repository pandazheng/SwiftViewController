//
//  ViewController.swift
//  UIDatePicker
//
//  Created by pandazheng on 15/5/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var datePicker : UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func datePickerValueChange(sender : UIDatePicker)
    {
//        var format = NSDateFormatter()
//        //设置日期格式
//        //format.dateStyle = NSDateFormatterStyle.ShortStyle
//        format.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        //把datePicker的date日期转化为String
//        var dataStr = format.stringFromDate(sender.date)
//        println(dataStr)
        
    }
    
    @IBAction func butttonClick(sender : UIButton)
    {
        datePicker?.countDownDuration -= 60
    }

}

