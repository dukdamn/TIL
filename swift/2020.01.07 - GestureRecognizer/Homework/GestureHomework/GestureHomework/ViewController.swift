//
//  ViewController.swift
//  GestureHomework
//
//  Created by 황정덕 on 2020/01/07.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let countLabel = UILabel()
  private let locationLabel = UILabel()
  var gesture = UIGestureRecognizer()
  lazy var checkSegment: UISegmentedControl = {
    let sc: UISegmentedControl = UISegmentedControl(items: array)
    sc.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    sc.tintColor = UIColor.black
    return sc
  }()
  
  let array: [String] = ["1번","2번","3번"]
  private var count = 0 {
    didSet {
      countLabel.text = "횟수 : \(count)"
    }
  }
  private var locationText = "좌표 : (0.0, 0.0)" {
    didSet {
      locationLabel.text = locationText
    }
  }
  
  private var beforePoint: CGPoint? = nil
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    baceUI()
    autolayout()
    gesture.delegate = self
    view.addGestureRecognizer(gesture)
  }
  func baceUI(){
    countLabel.text = "횟수 : \(count)"
    countLabel.backgroundColor = .white
    countLabel.font = UIFont.systemFont(ofSize: 20)
    view.addSubview(countLabel)
    
    locationLabel.text = locationText
    locationLabel.backgroundColor = .white
    locationLabel.font = UIFont.systemFont(ofSize: 20)
    view.addSubview(locationLabel)
    
    //    checkSegment.backgroundColor = .cyan
    //    checkSegment.tintColor = .black
    //    checkSegment.insertSegment(withTitle: "1", at: 0, animated: true)
    //    checkSegment.insertSegment(withTitle: "2", at: 1, animated: true)
    //    checkSegment.insertSegment(withTitle: "3", at: 2, animated: true)
    view.addSubview(checkSegment)
    
  }
  func autolayout(){
    checkSegment.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      checkSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      checkSegment.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      checkSegment.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      checkSegment.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    countLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      countLabel.topAnchor.constraint(equalTo: checkSegment.bottomAnchor, constant: 10),
      countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      countLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      countLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      locationLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 10),
      locationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      locationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      locationLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first, checkSegment.selectedSegmentIndex == 0 else { return }
    let touchPoint = touch.location(in: touch.view)
    
    let formetter = NumberFormatter()
    formetter.minimumFractionDigits = 1
    formetter.maximumFractionDigits = 1
    guard let numberX = formetter.string(from: touchPoint.x as NSNumber),
      let numberY = formetter.string(from: touchPoint.y as NSNumber) else { return }
    if distance(beforePoint ?? touchPoint,touchPoint) > 100 {
      count = 0
      locationText = "좌표 : (\(numberX), \(numberY))"
    } else {
      count += 1
      locationText = "좌표 : (\(numberX), \(numberY))"
    }
    print(distance(beforePoint ?? touchPoint,touchPoint))
    beforePoint = touchPoint
    print(touchPoint)
    print(checkSegment.selectedSegmentIndex)
  }
  
  @objc
  private func toggleImageViewSize(_ sender: UITapGestureRecognizer) {
    let normalWidthAndHeight: CGFloat = 150
    print("duck")
  }
  
  
  func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
    let xDist = a.x - b.x
    let yDist = a.y - b.y
    return CGFloat(sqrt(xDist * xDist + yDist * yDist))
  }
}

extension ViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    let touchPoint = touch.location(in: touch.view)
    return false
  }
}
