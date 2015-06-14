//
//  ViewController.swift
//  TapGesturesDemo
//
//  Created by pandazheng on 15/6/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapGestureRecognizer : UITapGestureRecognizer!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTaps:")
        
        tapGestureRecognizer.numberOfTouchesRequired = 2
        tapGestureRecognizer.numberOfTapsRequired = 3
    }
    
    func handleTaps(sender : UITapGestureRecognizer)
    {
        for touchCounter in 0..<sender.numberOfTouchesRequired
        {
            let touchPoint = sender.locationOfTouch(touchCounter, inView: sender.view)
            
            println("Touch \(touchCounter + 1) : \(touchPoint)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let controller = UIAlertController(title: "Two Fingers", message: "Please use two fingers", preferredStyle: UIAlertControllerStyle.Alert)
//        controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        presentViewController(controller, animated: true, completion: nil)
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

