//
//  SwitchTableViewCell.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
  static let identifier = "SwitchTableViewCell"

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    print("check")
    let v = UISwitch(frame: .zero)
    accessoryView = v
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
//  override func awakeFromNib() {
//    super.awakeFromNib()
//    
//  }
//  
//  override func setSelected(_ selected: Bool, animated: Bool) {
//    super.setSelected(selected, animated: animated)
//    
//    // Configure the view for the selected state
//  }
  
}
