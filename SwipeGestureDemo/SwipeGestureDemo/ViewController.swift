//
//  ViewController.swift
//  SwipeGestureDemo
//
//  Created by pandazheng on 15/6/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var swipeRecognizer : UISwipeGestureRecognizer!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipes:")
    }
    
    func handleSwipes(sender : UISwipeGestureRecognizer)
    {
        if sender.direction == UISwipeGestureRecognizerDirection.Down
        {
            println("Swiped Down")
        }
        
        if sender.direction == UISwipeGestureRecognizerDirection.Left
        {
            println("Swiped Left")
        }
        
        if sender.direction == UISwipeGestureRecognizerDirection.Right
        {
            println("Swiped Right")
        }
        
        if sender.direction == UISwipeGestureRecognizerDirection.Up
        {
            println("Swiped Up")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        swipeRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        
        swipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(swipeRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

