//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

// 이미지를 클릭한 이후에만 마우스 움직임을 따라서 이미지뷰가 함꼐 움직이도록
final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  var isHoldingImage = false
  var lastTouchPoint = CGPoint.zero
 
  override func viewDidLoad() {
    super.viewDidLoad()
    // 자체로는 동그라미로 만들음, 이미지자체는 동그라미로 되지 않음, 이미지가 화면박으로 더 나옴
    imageView.layer.cornerRadius = imageView.frame.width / 2
    // 뷰의 영역밖을 나온 이미지를 나오지 않게 함
    imageView.clipsToBounds = true
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    print("\n----------[touchesBegan]----------\n")
    // 처음 터치한 뷰
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
//    print(touchPoint)
//    if imageView.frame.maxX > touchPoint.x && imageView.frame.maxY > touchPoint.y {
//      if imageView.frame.minX < touchPoint.x && imageView.frame.minY < touchPoint.y {
//        imageView.image = UIImage(named: "cat2")
//      }
//    }
    // 이미지만 눌렀을떄 바뀌도록
    if imageView.frame.contains(touchPoint){
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
      lastTouchPoint = touchPoint
    }
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
//    print("\n----------[touchesMoved]----------\n")
    guard isHoldingImage, let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    
    imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
    imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
    lastTouchPoint = touchPoint
    
//    let prevTouchPoint = touch.preciseLocation(in: touch.view)
//    imageView.center.x = imageView.center.x + (touchPoint.x - prevTouchPoint.x)
//    imageView.center.y = imageView.center.y + (touchPoint.y - prevTouchPoint.y)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    print("\n----------[touchesEnded]----------\n")
    imageView.image = UIImage(named: "cat1")
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    print("\n----------[touchesCancelled]----------\n")
    imageView.image = UIImage(named: "cat1")
  }
  
  
}



