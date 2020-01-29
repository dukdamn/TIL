//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Action

}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
