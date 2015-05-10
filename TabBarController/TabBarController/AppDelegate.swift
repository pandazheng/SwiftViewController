//
//  AppDelegate.swift
//  TabBarController
//
//  Created by pandazheng on 15/5/10.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        //创建三个界面
        let vc1 : UIViewController = FirstViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        //TabBarItem
        nav1.tabBarItem = UITabBarItem(title: "第一项", image: nil, selectedImage: nil)
        //创建一个图片UIImage对象
//        let image1 = UIImage(named: "test.jpg")
//        nav1.tabBarItem = UITabBarItem(title: "第一项", image: image1, selectedImage: nil)
        
        let vc2 : UIViewController = SecondViewController()
        let nav2 = UINavigationController(rootViewController: vc2)
        //TabBarItem
        nav2.tabBarItem = UITabBarItem(title: "第二项", image: nil, selectedImage: nil)
        
        let vc3 : UIViewController = ThreeViewController()
        let nav3 = UINavigationController(rootViewController: vc3)
        //TabBarItem
        nav3.tabBarItem = UITabBarItem(title: "第三项", image: nil, selectedImage: nil)
        
        let arr = [nav1,nav2,nav3]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = arr;
        
        self.window?.rootViewController = tabBarController
        
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

