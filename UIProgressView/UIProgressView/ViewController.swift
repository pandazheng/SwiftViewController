//
//  ViewController.swift
//  UIProgressView
//
//  Created by pandazheng on 15/5/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progress : UIProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progress?.progress = 0
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update:", userInfo: nil, repeats: true)
        
    }
    
    func update(sender : NSTimer)
    {
        progress?.progress += 0.1
        if (progress?.progress >= 1)
        {
            sender.invalidate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

