//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {
  
  let dataSource = cards
//  let layout = UICollectionViewFlowLayout()
//  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
//  let collectionView = UICollectionView()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
    
    
    
    // 정덕이 한것
    // edgeInset = 9
    // 셀 간격, 줄 간격 = 4
    
    let degeInset = CGFloat(8)
    let magin = CGFloat(6)
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: degeInset, left: degeInset, bottom: degeInset, right: degeInset)
    layout.minimumLineSpacing = magin
    layout.minimumInteritemSpacing = magin
    layout.itemSize = CGSize(
      width: (view.frame.width - (degeInset * 2 + magin * 3)) / 4,
      height: 180)
    let collectionView = UICollectionView(frame: view.frame.offsetBy(dx: 0, dy: 0), collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    view.addSubview(collectionView)
    
  }
  func setupCollectionView(){
    
  }
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
    cell.backgroundColor = dataSource[indexPath.item].color
    return cell
  }
}
