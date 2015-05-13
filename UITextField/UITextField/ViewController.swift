//
//  ViewController.swift
//  UITextField
//
//  Created by pandazheng on 15/5/13.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textField : UITextField?
    
    @IBAction func textFieldExit(sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func controlTouchDown(sender: UIControl)
    {
        textField?.resignFirstResponder()
    }


}

