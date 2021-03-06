//
//  ViewController.swift
//  CarthageTest
//
//  Created by 황정덕 on 2020/02/20.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
final class ViewController: UIViewController {
  let squareView = UIView()
  let bottomCircleView = UIView()
  override func viewDidLoad() {
    super.viewDidLoad()
        snapKitExample()
    
  }
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      bottomCircleView.layer.cornerRadius = bottomCircleView.frame.width / 2
      snapKitExample()
    }
  func snapKitExample() {
    squareView.backgroundColor = .green
    view.addSubview(squareView)
    let topView = UIView()
    topView.backgroundColor = .black
    squareView.addSubview(topView)
    let topLabel = UILabel()
    topLabel.text = "TopView"
    topLabel.textColor = .white
    topLabel.textAlignment = .center
    topLabel.font = UIFont.boldSystemFont(ofSize: 25)
    topView.addSubview(topLabel)
    let bottomView = UIView()
    bottomView.backgroundColor = .yellow
    squareView.addSubview(bottomView)
    let bottomLabel = UILabel()
    bottomLabel.text = "BottomView"
    bottomLabel.textAlignment = .center
    bottomLabel.font = UIFont.boldSystemFont(ofSize: 25)
    bottomView.addSubview(bottomLabel)
    bottomCircleView.backgroundColor = .cyan
    view.addSubview(bottomCircleView)
    
    squareView.snp.makeConstraints{
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.7)
      $0.height.equalToSuperview().multipliedBy(0.4)
    }
    topView.snp.makeConstraints{
      $0.leading.top.trailing.equalToSuperview().inset(20)
    }
    bottomView.snp.makeConstraints{
      $0.top.equalTo(topView.snp.bottom)
      $0.height.equalTo(topView.snp.height)
      $0.leading.bottom.trailing.equalToSuperview().inset(20)
    }
    topLabel.snp.makeConstraints{
      $0.edges.equalToSuperview()
      //      $0.leading.top.trailing.bottom.equalToSuperview()
    }
    
    bottomLabel.snp.makeConstraints{
      //      $0.width.height.equalTo(topLabel)
      $0.size.equalTo(topLabel)
      $0.leading.bottom.equalToSuperview()
    }
    bottomCircleView.snp.makeConstraints{
      $0.top.equalTo(squareView.snp.bottom)
      $0.centerX.equalTo(squareView)
      $0.size.equalTo(squareView.snp.width).dividedBy(2)
    }
    
    /*
     [SnapKit]
     최초 제약 설정
     이미 설정한 특정 값을 다른 것으로 바꿀 때
     기존의 연결을 모두 제거하고 완전히 새로 설정
     
     */
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIView.animate(withDuration: 1) {
      self.bottomCircleView.snp.updateConstraints{
        $0.top.equalTo(self.squareView.snp.bottom).offset(-504)
      }
      self.view.layoutIfNeeded()
    }
  }
}

