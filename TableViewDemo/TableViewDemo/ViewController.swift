//
//  ViewController.swift
//  TableViewDemo
//
//  Created by pandazheng on 15/5/15.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet var tableView : UITableView?
    
    var provinces = ["四川","云南","山东"]
    var cities = ["四川":["成都","绵阳","广元","成都","绵阳","广元"],"云南":["昆明","大理","丽江","昆明","大理","丽江"],"山东":["济南","青岛","威海"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var provinceName = provinces[section]
        return cities[provinceName]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId = "cellId"
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        //先得到当前section名称，省名称
        var proName = provinces[indexPath.section]
        //得到当前row索引的城市名称
        cell?.textLabel?.text = cities[proName]?[indexPath.row]
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell!
    }
    
    //有多少个Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return provinces.count
    }
    
    //section标题
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return provinces[section]
    }
    
    //索引
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return provinces
    }
    
    //选择
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println("选择了\(indexPath.row)")
        var provinceName = provinces[indexPath.section]
        println("选择了\(cities[provinceName]![indexPath.row])")
    }

}

