//
//  CustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let myLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // 커스텀 뷰를 올릴 때는 contentView 위에 추가
    contentView.addSubview(myLabel)
    myLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    myLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // 오토레이아웃으로 설정하는 메소드
//  override func updateConstraints() {
//    super.updateConstraints()
//  }
  
  
  // 레이아웃 조정 시
  // 크기를 잡아주는 것
  // 프레임으로 해야댐
  override func layoutSubviews() {
    super.layoutSubviews()
//    myLabel.frame = CGRect(x: frame.width - 120, y: 15, width: 100, height: frame.height - 30)
  }
}
