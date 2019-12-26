//
//  CustomCell.swift
//  tableViewHomework
//
//  Created by 황정덕 on 2019/12/19.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit
protocol CustomCellDelegate: class {
  func buttonDidTap()
}
class CustomCell: UITableViewCell {
  weak var delegate: CustomCellDelegate?
  let myLabel = UILabel()
  let myButton = UIButton()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    // 커스텀 뷰를 올릴 때는 contentView 위에 추가
    //    contentView.addSubview(myLabel)
    
  
    myButton.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    myButton.setTitle("duck", for: .normal)
    
//    myButton.titleLabel
    myButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    myButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    contentView.addSubview(myButton)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func buttonAction(_ sender: Any){
    print(contentView.tag)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    myButton.frame = CGRect(x: frame.width - 120, y: 15, width: 100, height: frame.height - 30)
  }
}
