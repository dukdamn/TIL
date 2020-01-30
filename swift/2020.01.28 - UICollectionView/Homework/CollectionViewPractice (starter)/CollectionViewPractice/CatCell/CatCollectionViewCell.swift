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
  private let checkImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
    imageView.tintColor = .white
    imageView.isHidden = true
    return imageView
  }()
  private let blindView = UIView()
  static let identifier = "CatCollectionViewCell"
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  override var isSelected: Bool {
    didSet {
      checkImageView.isHidden = !isSelected
      blindView.backgroundColor = isSelected ? UIColor.black.withAlphaComponent(0.4) : .clear
    }
  }
  
  func configure(catImage: UIImage?) {
    catImageView.image = catImage
  }
  
  private func setupUI(){
    [catImageView, checkImageView,blindView].forEach {
      contentView.addSubview($0)
    }
    catImageView.layer.cornerRadius = 10
    catImageView.layer.masksToBounds = true
    catImageView.contentMode = .scaleAspectFill
    
    blindView.layer.cornerRadius = 10
//    blindView.backgroundColor =  UIColor.black.withAlphaComponent(0.4)
//    : .clear
    
    
  }
  
  private func setupConstraints(){
    catImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      catImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      catImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      //        cafeImageView.widthAnchor.constraint(equalToConstant: margin * 10),,
    ])
    
    checkImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      checkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      checkImageView.widthAnchor.constraint(equalToConstant: 32),
      checkImageView.heightAnchor.constraint(equalToConstant: 32),
    ])
    
    blindView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blindView.topAnchor.constraint(equalTo: contentView.topAnchor),
      blindView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      blindView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      blindView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
