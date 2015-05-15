//
//  ViewController.swift
//  TableView
//
//  Created by pandazheng on 15/5/15.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet var tableView : UITableView!
    
    var cites = ["成都","北京","上海","广州","深圳"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 48))
        //cell.textLabel?.text = cites[indexPath.row]
        //var cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 48))
        var cellId = "cellid"
        
        /*var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }*/
        var cell : CityCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? CityCell
        
        if cell == nil
        {
            cell = CityCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        cell?.cityLabel?.text = cites[indexPath.row]
        cell?.cityTextField?.placeholder = "input number"
        cell?.citySwitch?.on = true
        /*
        cell?.backgroundColor = UIColor.grayColor()
        cell?.textLabel?.text = cites[indexPath.row]
        cell?.detailTextLabel?.text = "detail more..."
        cell?.accessoryType = UITableViewCellAccessoryType.DetailButton*/
        return cell!
    }

}

