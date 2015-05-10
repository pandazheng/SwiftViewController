//
//  ViewController.swift
//  SwiftUI
//
//  Created by pandazheng on 15/5/10.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit


class ViewController: UIViewController , FontSizeChangeDelegate{
    
//    var clickCount = 0
//    var myLabel : UILabel?
    
    var myLabel : UILabel?     //申明一个UILabel对象，全局的

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "熊猫正正"
        
        //放一个UIBarButtonItem
        let nextItem = UIBarButtonItem(title: "下一页", style: UIBarButtonItemStyle.Plain, target: self, action: "nextPage")
        
        self.navigationItem.rightBarButtonItem = nextItem
        
        let rect = CGRect(x: 0, y: 100, width: 320, height: 44)
        myLabel = UILabel(frame: rect)
        myLabel!.text = "熊猫正正"
        self.view.addSubview(myLabel!)
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.backgroundColor = UIColor.redColor()
//        
//        var label = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2, width: 200, height: 200))
//        label.backgroundColor = UIColor.greenColor()
//        label.text = "TEST"
//        label.textColor = UIColor.blueColor()
//        label.textAlignment = .Center
//        label.sizeToFit()
//        self.view.addSubview(label)
//        
//        let rect = CGRect(x: 0, y: 100, width: 320, height: 44);
//        myLabel = UILabel(frame: rect)
//        myLabel!.text = "MYLABEL"
//        self.view.addSubview(myLabel!)
//        
//        var myButton = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 44))
//        myButton.setTitle("点击我?", forState: UIControlState.Normal)
//        myButton.backgroundColor = UIColor.blueColor()
//        myButton.addTarget(self, action: "clickMe:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(myButton)
    }
    
    func nextPage()
    {
        println("点击了 nextPage")
        //推出下一页
        let svc = SecondViewController()
        //推出下一个界面 animated:true 表示用动画形式
        svc.delegate = self   //设置这个协议
        self.navigationController?.pushViewController(svc, animated: true)
    }
    
//    func clickMe(sender: UIButton)
//    {
//        println("click me \(clickCount++)")
//        myLabel?.text = "CLICK ME \(clickCount)"
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fontSizeDidChange(controller: SecondViewController, fontSize: Int) {
        println("controller is \(controller) fontsize: \(fontSize)")
        //实际设置myLabel的fontSize
        let font = UIFont.systemFontOfSize(CGFloat(fontSize))
        myLabel?.font = font
    }

}

