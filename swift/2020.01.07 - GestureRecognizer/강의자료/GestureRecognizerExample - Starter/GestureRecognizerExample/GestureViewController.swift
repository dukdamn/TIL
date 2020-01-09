//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//
import AudioToolbox
import UIKit

final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  var tapCheck = true
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
  }
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer){
    print("\n----------[Tap!!]----------\n")
    // 인식이 제대로 확인하기 위해 상태 확인
    guard sender.state == .ended else { return }
    
    
//    imageView.transform 2차행열 삼각함수
    if tapCheck {
      imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
//      회전 관련
//       위치 이동
//      imageView.transform = imageView.transform.translatedBy(x: 0, y: 100)
    } else {
      imageView.transform = CGAffineTransform.identity
    }
    
//    imageView.frame 방법
//    let checkCenter = imageView.center
//    if tapCheck {
//      imageView.frame.size = CGSize(width: imageView.frame.width * 2, height: imageView.frame.height * 2)
//      imageView.layer.cornerRadius = imageView.frame.width / 2
//      imageView.center = checkCenter
//    } else {
//      imageView.frame.size = CGSize(width: imageView.frame.width / 2, height: imageView.frame.height / 2)
//      imageView.layer.cornerRadius = imageView.frame.width / 2
//      imageView.center = checkCenter
//    }
    
    tapCheck.toggle()
  }
  
  @IBAction private func handleTapTwoGesture(_ sender: UIRotationGestureRecognizer){
//    guard sender.state == .ended else { return }
    
//    imageView.transform = imageView.transform.rotated(by: 5)
    
    imageView.transform = imageView.transform.rotated(by: sender.rotation)
    sender.rotation = 0
  }
  
  @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer){
//    if sender.direction.isEmpty == true {
//      imageView.image = UIImage(named: "cat1")
//    } else {
//      imageView.image = UIImage(named: "cat2")
//    }
    switch sender.direction {
    case .left:
      imageView.image = UIImage(named: "cat2")
      sender.direction = .right
    case .right:
      imageView.image = UIImage(named: "cat1")
      sender.direction = .left
    default:
      return
    }
  }
  
  
  var initialCenter = CGPoint()
  @IBAction private func handlePanGesture(_ sender: UIPanGestureRecognizer){
    guard let dragView = sender.view else { return }
    dragView.isUserInteractionEnabled = true
    let transition = sender.translation(in: dragView.superview)
    if sender.state == .began {
      initialCenter = dragView.center
    }
    
    if sender.state != .cancelled {
      dragView.center = CGPoint(x: initialCenter.x + transition.x,
                                y: initialCenter.y + transition.y)
    } else {
      dragView.center = initialCenter
    }
    
//    let changedX = imageView.center.x + transition.x
//    let changedY = imageView.center.y + transition.y
//    imageView.center = CGPoint(x: changedX, y: changedY)
//    sender.setTranslation(CGPoint.zero, in: imageView)
  }
  @IBAction private func handleLongGesture(_ sender: UILongPressGestureRecognizer){
    if(sender.accessibilityActivate()) {
      print("duck")
    } else {
      print("duck")
      vibrate()
    }
  }
//  import AudioToolbox.AudioServices
  private func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }

}
