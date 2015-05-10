//
//  SecondViewController.swift
//  SwiftUI
//
//  Created by pandazheng on 15/5/10.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation
import UIKit

//定义一个协议
protocol FontSizeChangeDelegate : NSObjectProtocol
{
    //定义一个协议的函数/代理的一个函数
    func fontSizeDidChange(controller:SecondViewController,fontSize:Int)
}

class SecondViewController : UIViewController
{
    var fontSize : Int = 20
    //定义一个delegate对象，写上协议对象
    var delegate:FontSizeChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "第二页"
        
        self.view.backgroundColor = UIColor.redColor()
        
        var b = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        var frame = CGRect(x: 100, y: 100, width: 100, height: 40)
        b.frame = frame
        b.setTitle("返回上一层", forState: UIControlState.Normal)
        //给按钮增加点击事件
        b.addTarget(self, action: "clickMe:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(b)
    }
    
    func clickMe(sender : UIButton)
    {
        //self.navigationController?.popViewControllerAnimated(true)
        fontSize++
        println("fontsize is \(fontSize)")
        if ((delegate) != nil)
        {
            //调用协议里的方法
            delegate?.fontSizeDidChange(self, fontSize: fontSize)
        }
    }
}