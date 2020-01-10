//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2020. 01. 05..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {

  // MARK: Properties
  
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var imageView: UIImageView!
  
  
  private var zoomScale: CGFloat = 1.0
//  {
//    didset {
//      print("current zoom Scale :", String(format: "%.2", zoomScale))
//    }
//  }
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    scrollView.bounces = true
    // 확대가능
    scrollView.alwaysBounceVertical = true
    updateScrollViewZoomScale()
  }
  
  private func updateScrollViewZoomScale(){
    let widthScale = view.frame.width / imageView.bounds.width
    let heightScale = view.frame.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    
    // 더 높은값을 다른데 주더라도 맥스와 민을 주어서 그만큼 커지거나 내려가지 않음
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = 1
    scrollView.maximumZoomScale = 3
  }
  
  // MARK: Action Handler
  
  @IBAction private func fitToWidth(_ sender: Any) {
    print("\n---------- [ fitToWidth ] ----------")
    zoomScale = scrollView.frame.width / imageView.bounds.width
    print(scrollView.frame.width)
    print(imageView.bounds.width)
    print(zoomScale)
    scrollView.setZoomScale(zoomScale, animated: true)
  }
  
  @IBAction private func scaleDouble(_ sender: Any) {
    print("\n---------- [ scaleDouble ] ----------")
    scrollView.setZoomScale(zoomScale * 2, animated: true)
    zoomScale = scrollView.zoomScale
    
    // 이 위치에 보여줘라
    let rectToVisble = CGRect(x: 100, y: 100, width: 200, height: 300)
    scrollView.zoom(to: rectToVisble, animated: true)
  }

  @IBAction private func moveContentToLeft(_ sender: Any) {
    print("\n---------- [ moveContentToLeft ] ----------")
    let newOffset = CGPoint(x: scrollView.contentOffset.x + 150,
                            y: scrollView.contentOffset.y)
    scrollView.setContentOffset(newOffset, animated: true)
  }
  
  
}


extension ViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    imageView
  }
}


