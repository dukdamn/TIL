//
//  ViewController.swift
//  2020.01.10 - Homework
//
//  Created by 황정덕 on 2020/01/10.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  var pageControl = UIPageControl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    scrollView.isPagingEnabled = true
    scrollView.alwaysBounceVertical = false
    
    
    pageControl.frame = CGRect(x: view.frame.midX - 50, y: view.frame.maxY - 150, width: 100, height: 50)
    pageControl.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    pageControl.isUserInteractionEnabled = false
//    pageControl.currentPage = 0
//
    pageControl.numberOfPages = 4
    view.addSubview(pageControl)
  }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // floor 내림, ceil 올림
        // contentOffset는 현재 스크롤된 좌표
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
      
//      pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
