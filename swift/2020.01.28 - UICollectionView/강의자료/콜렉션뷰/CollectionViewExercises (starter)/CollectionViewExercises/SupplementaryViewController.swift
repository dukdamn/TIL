//
//  SupplementaryViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class SupplementaryViewController: UIViewController {
  
  var dataSource: [Section] = sections
  // 셀 크기 = (80, 80) / 아이템과 라인 간격 = 4 / 인셋 = (25, 5, 25, 5)
  // 헤더 높이 50, 푸터 높이 3
  let layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.headerReferenceSize = CGSize(width: 50, height: 50)
    layout.sectionHeadersPinToVisibleBounds = true
    layout.footerReferenceSize = CGSize(width: 3, height: 3)
    return layout
  }()
  let uiView = UIView()
  lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    cv.backgroundColor = .white
    cv.dataSource = self
    cv.delegate = self
    view.addSubview(cv)
    return cv
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupFlowLayout()
    setupCollectionView()
    
    uiView.backgroundColor = .red
//    let panGesturreRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
    //collectionView.addGestureRecognizer(panGesturreRecognizer)
  }
  @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer){
//    let touchLocation = sender.location(in: self.view)
    //    self.view.center = touchLocation
    print(sender.translation(in: self.view))
  }
  
  func setupCollectionView() {
    // 해더 설정
    collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
    // 푸터 설정
    collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
  }
  
  func setupFlowLayout() {
    let itemsInLine: CGFloat = 4
    let spacing: CGFloat = 4
    let inset = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 5)
    //    한번호출되야 lazy가 되므로 view로 넓이값 주면안댐
    //    let cvWidth = view.frame.width
    let cvWidth = collectionView.bounds.width
    let contentSize = (cvWidth - inset.left - inset.right - (spacing * (itemsInLine - 1)))
    // 반올림 내림
    let itemSize = (contentSize / itemsInLine).rounded(.down)
    
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    layout.sectionInset = inset
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
  }
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource.count
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource[section].cards.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = dataSource[indexPath.section].cards[indexPath.item].color
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
      header.configure(title: "Section \(indexPath.section)")
      return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
      footer.backgroundColor = .gray
      return footer
    }
  }
}
extension SupplementaryViewController: UICollectionViewDelegate {
  func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
    print("\n----------[collectionViewDidEndMultipleSelectionInteraction]----------\n")
  }
//  // 지정된 항목을 선택해야하는지 대리인에게 묻는다
//  func collectionView(_ collectionView: UICollectionView,
//                               shouldSelectItemAt indexPath: IndexPath) -> Bool {
//    true
//  }
  // 지정된 인덱스 경로의 항목이 선택되었음을 대리인에게 알립니다.
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    print("\n----------[didSelectItemAt]----------\n")
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      didDeselectItemAt indexPath: IndexPath) {
    print("\n----------[didDeselectItemAt]----------\n")
  }
  func collectionView(_ collectionView: UICollectionView,
                      didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
    print("\n----------[didBeginMultipleSelectionInteractionAt]----------\n")
  }
}
