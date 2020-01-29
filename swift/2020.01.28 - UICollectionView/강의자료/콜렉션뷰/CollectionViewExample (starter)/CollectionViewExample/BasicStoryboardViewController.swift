//
//  BasicStoryboardViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicStoryboardViewController: UIViewController {

  @IBOutlet private weak var collectionView: UICollectionView!
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  
}

extension BasicStoryboardViewController: UICollectionViewDataSource {
  
  // low가 아니라 item
  //
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 3
  }
  
  // cell tableview와 다르게 레이블이나 타이틀 제공 안함
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
    cell.backgroundColor = .red
    if let imageView = cell.contentView.subviews.first as? UIImageView {
      imageView.image = UIImage(named: parkImages[indexPath.item % parkImages.count])
      imageView.contentMode = .scaleToFill
      cell.layer.cornerRadius = cell.frame.width / 2
    }
    return cell
  }
  
  
}
