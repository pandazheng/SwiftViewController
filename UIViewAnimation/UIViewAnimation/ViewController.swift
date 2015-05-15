//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by pandazheng on 15/5/15.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var FirstView : UIView!
    
    var OriginFrame : CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.OriginFrame = self.FirstView.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAnimation(sender : AnyObject)
    {
        //self.baseAnimate()
        //self.opeationAnimate()
        self.testLayerProperty()
    }
    
    @IBAction func fallbackAnimation(sender : AnyObject)
    {
        self.FirstView.frame = OriginFrame
        self.FirstView.layer.removeAllAnimations()
    }
    
    func baseAnimate()
    {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.FirstView.frame.origin.x += 100
        })
    }
    
    func opeationAnimate()
    {
        UIView.animateWithDuration(2.0, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            println("CurveEaseIn")
            self.FirstView.frame.origin.x += 100
        }) { (finish) -> Void in
            println("finish")
        }
    }
    
    func testLayerProperty()
    {
        var myLayer = CALayer()
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.borderWidth = CGFloat(5.0)
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.greenColor().CGColor
        myLayer.shadowOffset = CGSizeMake(25.0, 25.0)
        myLayer.shadowOpacity = 0.5
        myLayer.frame = CGRectMake(100, 100, 100, 100)
        
        self.view.layer.addSublayer(myLayer)
    }
}

