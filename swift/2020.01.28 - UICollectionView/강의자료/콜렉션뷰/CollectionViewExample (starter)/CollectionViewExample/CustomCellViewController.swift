//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//
import UIKit
final class CustomCellViewController: UIViewController {
  let flowLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(
    frame: view.frame, collectionViewLayout: flowLayout
  )
  let itemCount = 120
  //120개 보이게~~
  let parkImage = ParkManager.imageNames(of: .nationalPark)
  
  var showImage = false

  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }
  // MARK: Setup Views
  private func setupCollectionView() {
    setupFlowLayout()
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    view.addSubview(collectionView)
  }
  private func setupFlowLayout() {
    if showImage {
      flowLayout.itemSize = CGSize(width: 120, height: 120)
      flowLayout.minimumLineSpacing = 15
      flowLayout.minimumInteritemSpacing = 20
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }else{
      flowLayout.itemSize = CGSize(width: 60, height: 60)
      flowLayout.minimumLineSpacing = 20
      flowLayout.minimumInteritemSpacing = 10
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
  }
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(
      barButtonSystemItem: .refresh,
      target: self,
      action: #selector(changeCollectionViewItems(_:))
    )
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItems = [changeItem, changeDirection]
  }
  // MARK: Action
  @objc private func changeCollectionViewItems(_ sender: Any) {
    showImage.toggle()
    setupFlowLayout()
    collectionView.reloadData()
  }
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = flowLayout.scrollDirection
    flowLayout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
  }
  func color(at IndexPath: IndexPath) -> UIColor {
    let max = itemCount
    let currentIndex = CGFloat(IndexPath.item)
    //최소값 0.1 ~ 최대값 0.9 괄호 연산이 최대 1일때 0.8로 만들어버림 그래서 최대값은 0.9, 최소값은 0.1
    let factor = 0.1 + (currentIndex / CGFloat(max)) * 0.8
    return .init(hue: factor, saturation: factor, brightness: 1, alpha: 1)
    //            색상             채도                  명도
  }
}


// MARK: - UICollectionViewDataSource
extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell!
    if showImage {
      let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
      let item = indexPath.item % parkImage.count
      customCell.configure(image: UIImage(named: parkImage[item]), title: parkImage[item])
      
      cell = customCell
    } else {
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
      cell.layer.cornerRadius = cell.frame.width / 2
      
    }
    cell.backgroundColor = color(at: indexPath)
    return cell
  }
}
extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.alpha = 0
    // 투명
    cell.transform = .init(scaleX: 0.3, y: 0.3)
    
    UIView.animate(withDuration: 0.3) {
      cell.alpha = 1
      cell.transform = .identity
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    if indexPath.item % 5 == 2 {
      return layout.itemSize.applying(.init(scaleX:2, y:2))
    } else {
      return layout.itemSize
    }
  }
}
