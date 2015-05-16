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
    @IBOutlet weak var SecondView : UIView!
    
    var OriginFrame1 : CGRect!
    var OriginFrame2 : CGRect!
    
    var myLayer : CALayer!
    
    var FirstSubView : UIView!
    var OriginSubView : CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.OriginFrame1 = self.FirstView.frame
        self.OriginFrame2 = self.SecondView.frame
        
        
        self.FirstSubView = UIView(frame: CGRect(x: 20, y: 10, width: 50, height: 50))
        self.FirstSubView.backgroundColor = UIColor.purpleColor()
        self.FirstView.addSubview(self.FirstSubView)
        
        self.OriginSubView = self.FirstSubView.frame
        //self.testLayerProperty()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAnimation(sender : AnyObject)
    {
        //self.baseAnimate()
        //self.opeationAnimate()
        //self.beginCommitAnimate()
        //self.OperateSubView()
        self.replaceView()
        //self.testLayerProperty()
        //self.implicitAnimation()
        //self.CaBasicAnimation()
        //self.NewKeyFrameAnimate()
    }
    
    @IBAction func fallbackAnimation(sender : AnyObject)
    {
        self.FirstView.frame = OriginFrame1
        self.SecondView.frame = OriginFrame2
        self.FirstView.layer.removeAllAnimations()
        self.SecondView.layer.removeAllAnimations()
        self.FirstSubView.frame = OriginSubView

    }
    
    func baseAnimate()
    {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.FirstView.frame.origin.x += 100
        })
    }
    
    func opeationAnimate()
    {
        UIView.animateWithDuration(2.0, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            println("CurveEaseIn")
            self.FirstView.frame.origin.x += 100
            
            //动画嵌套运行
            //嵌入的动画默认继承外层动画的一些属性
            UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.OverrideInheritedDuration | UIViewAnimationOptions.OverrideInheritedCurve | UIViewAnimationOptions.CurveEaseOut , animations: { () -> Void in
                self.SecondView.frame.origin.x += 100
            }, completion: { (finish) -> Void in
                println("innear animate finish")
            })
        }) { (finish) -> Void in
            println("outter animate finish")
        }
    }
    
    //IOS 4.0之前
    func beginCommitAnimate()
    {
        //声明动画开始并配置动画属性
        UIView.beginAnimations("testAnimate", context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector("animationDidStart:")
        UIView.setAnimationDidStopSelector("animationDidStop:")
        
        //操作视图
        self.FirstView.backgroundColor = UIColor.magentaColor()
        
        //提交动画
        UIView.commitAnimations()
    }
    
    //操作子视图
    func OperateSubView()
    {
        UIView.transitionWithView(self.FirstView, duration: 2.0, options: UIViewAnimationOptions.TransitionCrossDissolve | UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            self.FirstSubView.frame.origin.x += 200
            //self.FirstSubView.hidden = true
        }) { (finish) -> Void in
            println("finish")
        }
    }
    
    //替换视图
    func replaceView()
    {
        var view = UIView(frame: CGRect(x: 50, y: 400, width: 268, height: 68))
        view.backgroundColor = UIColor.magentaColor()
        UIView.transitionFromView(self.SecondView, toView: view, duration: 2.0, options: UIViewAnimationOptions.TransitionCrossDissolve) { (finish) -> Void in
            println("替换完成")
        }
    }
    
    override func animationDidStart(anim: CAAnimation!) {
        println("Animation Start")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("Animation Stop")
    }
    
    //层
    func testLayerProperty()
    {
        myLayer = CALayer()
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.borderWidth = CGFloat(5.0)
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.greenColor().CGColor
        myLayer.shadowOffset = CGSizeMake(25.0, 25.0)
        myLayer.shadowOpacity = 2
        myLayer.frame = CGRectMake(100, 100, 100, 100)
        
        self.view.layer.addSublayer(myLayer)
    }
    
    //隐式动画
    func implicitAnimation()
    {
        myLayer.position.y += 30   //直接修改属性执行动画
    }
    
    //显示动画
    func CaBasicAnimation()
    {
        var imgView = UIImageView(image: UIImage(named: "ym.jpg"))
        imgView.frame = CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imgView)
        
        //选定角色
        var layer = imgView.layer
        
        //编写脚本
        var scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 2.0
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 2.0
        
        //编写另外脚本
        var opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.0
        opaqueAnimate.toValue = 1.0
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration = 2.0
        
        //把脚本交给角色，开始动画
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
        layer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
    
    }
    
    //关键帧动画
    func NewKeyFrameAnimate()
    {
        var imgView = UIImageView(image: UIImage(named: "ym.jpg"))
        imgView.frame = CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imgView)
        
        //选定角色
        var layer = imgView.layer
        
        //写脚本
        var keyAnimate = CAKeyframeAnimation(keyPath: "position")
        
        //设定关键帧
        var value0 = NSValue(CGPoint: layer.position)
        var value1 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y + 200))
        var value2 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y + 200))
        var value3 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y))
        var value4 = NSValue(CGPoint: layer.position)
        keyAnimate.values = [value0,value1,value2,value3,value4]
        
        keyAnimate.keyTimes = [0.0,0.4,0.6,0.7,1]
        
        var tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        var tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        var tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        var tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        keyAnimate.timingFunctions = [tf0,tf1,tf2,tf3]
        
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 4.0
        
        //演戏开始
        layer.addAnimation(keyAnimate, forKey: "keyAnimate")
    }
    
}

