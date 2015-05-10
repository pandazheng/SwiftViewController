//
//  RootViewController.swift
//  TableViewDemo
//
//  Created by pandazheng on 15/5/10.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation
import UIKit

class RootViewController : UIViewController , UITableViewDelegate , UITableViewDataSource
{
    
    //数据源NSMutableArray
    var dataArr = NSMutableArray()
    //全局的tableView对象
    var _tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据源
        for (var i = 0 ; i < 100 ; i++)
        {
            dataArr.addObject("row \(i)")
        }
        
        var rect : CGRect = self.view.bounds        //取得self.view区域
        _tableView = UITableView(frame: rect,style:.Plain)
        _tableView?.delegate = self
        _tableView?.dataSource = self
        self.view.addSubview(_tableView!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellid = "my cell id"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell
        
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
        
        var s = dataArr.objectAtIndex(indexPath.row) as? String
        cell!.textLabel?.text = s
        
        return cell!
    }
    
    //点击这个cell callback
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("row \(indexPath.row) selected")
    }
}
