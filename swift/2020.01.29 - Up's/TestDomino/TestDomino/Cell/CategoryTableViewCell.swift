//
//  CategoryTableViewCell.swift
//  TestDomino
//
//  Created by 황정덕 on 2020/01/29.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

  static let identifier = "CategoryTableViewCell"
  
  private let categoryImageView = UIImageView()
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func configure(category: String){
    print(category)
    categoryImageView.image = UIImage(named: category)
  }
  private func setUI(){
    categoryImageView.contentMode = .scaleToFill
    contentView.addSubview(categoryImageView)
    
    categoryImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
