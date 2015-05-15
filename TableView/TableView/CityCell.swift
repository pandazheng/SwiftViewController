//
//  CityCellTableViewCell.swift
//  TableView
//
//  Created by pandazheng on 15/5/15.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    var cityLabel : UILabel?
    var cityTextField : UITextField?
    var citySwitch : UISwitch?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //初始化子视图，子控件，然后添加到当前视图
        cityLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        cityTextField = UITextField(frame: CGRect(x: 90, y: 5, width: 80, height: 40))
        citySwitch = UISwitch(frame: CGRect(x: 200, y: 5, width: 80, height: 40))
        
        //添加到当前视图
        self.addSubview(cityLabel!)
        self.addSubview(cityTextField!)
        self.addSubview(citySwitch!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
