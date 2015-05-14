//
//  ViewController.swift
//  PickerView
//
//  Created by pandazheng on 15/5/14.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    
    @IBOutlet var pickerView : UIPickerView?
    
    //设定数据源
    var province = ["四川","云南","广东","广西"]
    var city = ["四川":["成都","绵阳","广元","宜宾"],"云南":["昆明","大理","丽江"],"广东":["广州","佛山","东莞"],"广西":["南宁","桂林"]]
    
    var selectValue = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerView?.delegate = self
        self.pickerView?.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设定列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //设定每列行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return province.count
        }
        else
        {
            if ( city[selectValue] != nil)
            {
                return city[selectValue]!.count
            }
            else
            {
                return 0
            }
        }
    }
    
    //显示值
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0
        {
            return province[row]
        }
        else
        {
            if (city[selectValue] != nil)
            {
                return city[selectValue]![row]
            }
            else
            {
                return "?"
            }
        }
    }
    
    //选择事件
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            selectValue = province[row]
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
}

