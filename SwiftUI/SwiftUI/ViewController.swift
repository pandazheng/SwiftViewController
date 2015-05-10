//
//  ViewController.swift
//  SwiftUI
//
//  Created by pandazheng on 15/5/10.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()
        
        var label = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2, width: 200, height: 200))
        label.backgroundColor = UIColor.greenColor()
        label.text = "TEST"
        label.textColor = UIColor.blueColor()
        label.textAlignment = .Center
        label.sizeToFit()
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

