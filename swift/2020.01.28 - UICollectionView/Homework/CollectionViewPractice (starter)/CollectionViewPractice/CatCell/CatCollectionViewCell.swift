//
//  CatCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 황정덕 on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CatCollectionViewCell: UICollectionViewCell {
  private let catImageView = UIImageView()
  static let identifier = "CatCollectionViewCell"
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  
  private func setupUI(){
    [catImageView].forEach {
      contentView.addSubview($0)
      
      catImageView.layer.cornerRadius = 10
      catImageView.layer.masksToBounds = true
      
      catImageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        catImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        catImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        //        cafeImageView.widthAnchor.constraint(equalToConstant: margin * 10),,
      ])
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
