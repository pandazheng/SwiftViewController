//
//  ViewController.swift
//  PanAndDragDemo
//
//  Created by pandazheng on 15/6/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var helloWorldLabel : UILabel!
    var panGestureRecognizer : UIPanGestureRecognizer!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let labelFrame = CGRect(x: 0, y: 0, width: 150, height: 100)
        helloWorldLabel = UILabel(frame: labelFrame)
        helloWorldLabel.userInteractionEnabled = true
        helloWorldLabel.text = "Hello World"
        helloWorldLabel.frame = labelFrame
        helloWorldLabel.backgroundColor = UIColor.blackColor()
        helloWorldLabel.textColor = UIColor.whiteColor()
        helloWorldLabel.textAlignment = NSTextAlignment.Center
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGestures:")
    }
    
    func handlePanGestures(sender : UIPanGestureRecognizer)
    {
        if sender.state != UIGestureRecognizerState.Ended && sender.state != UIGestureRecognizerState.Failed
        {
            let location = sender.locationInView(sender.view!.superview!)
            sender.view!.center = location
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(helloWorldLabel)
        
        panGestureRecognizer.minimumNumberOfTouches = 1
        panGestureRecognizer.maximumNumberOfTouches = 1
        
        helloWorldLabel.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

