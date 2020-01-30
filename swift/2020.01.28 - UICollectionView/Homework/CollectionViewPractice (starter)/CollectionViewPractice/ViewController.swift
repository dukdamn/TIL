//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private var collectionView: UICollectionView!
  private var catsData = [String]()
  private var cats = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    setupCollectionView()
    setupConstraints()
  }
  private func setupUI(){
    (0...9).forEach { cats.append("cat\($0)") }
    (0...9).forEach { catsData.append("cat\($0)") }
    
  }
  private let inset: CGFloat = 8
  private let lineSpacing: CGFloat = 8
  private let itemSpacing: CGFloat = 16
  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    layout.minimumInteritemSpacing = itemSpacing
    layout.minimumLineSpacing = lineSpacing
    let itemSize: CGFloat = (view.frame.width - inset * 2 - itemSpacing) / 2
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
    self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    self.collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: CatCollectionViewCell.identifier)
    self.collectionView.backgroundColor = .white
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.allowsMultipleSelection = true
    view.addSubview(collectionView)
  }
  
  private func setupConstraints() {
    
    let guide = self.view.safeAreaLayoutGuide
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
  
  private var deleteCheck = false
  @IBAction func deleteTap(_ sender: Any) {
    if deleteCheck {
      deleteItems()
    }
    deleteCheck.toggle()
  }
  private func deleteItems() {
    guard let seletedItems = collectionView.indexPathsForSelectedItems else { return }
    print(seletedItems)
    self.collectionView.deleteItems(at: seletedItems)
//    collectionView.deleteItems(at: <#T##[IndexPath]#>)
  }
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cats.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCollectionViewCell.identifier, for: indexPath) as! CatCollectionViewCell
    cell.configure(catImage: UIImage(named: cats[indexPath.item]))
    return cell as UICollectionViewCell
    
  }
  
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  // 셀 선택할수 있을지 없을지
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return deleteCheck
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
    print("Multiple Selection Should Begin")
    return true
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Did Select")
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    print("Did Deselect")
  }
}


//seletedItems
//  .sorted { $0.item > $1.item }
//  .forEach { cats.remove(at: $0.item)}
//if self.cats.isEmpty {
//  self.cats = catsData + catsData
//  self.collectionView.reloadData()
//} else {
//
//}
