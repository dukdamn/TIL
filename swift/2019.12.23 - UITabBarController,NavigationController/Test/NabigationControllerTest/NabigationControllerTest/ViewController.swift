//
//  ViewController.swift
//  NabigationControllerTest
//
//  Created by 황정덕 on 2019/12/23.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // iOS 11 이상
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .never
    title = "FirstVC"
    view.backgroundColor = .red
    let barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController))
    navigationItem.rightBarButtonItem = barButtonItem
    let testButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(pushViewController(_:)))
    navigationItem.leftBarButtonItem = testButtonItem
    

  }
  
  @objc private func pushViewController(_ sender: Any){
    let secondVC = SecondViewController()
    show(secondVC, sender: sender)
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
//
//    // 개게륵 가져오는 방법 2가지
//    let storyboard = UIStoryboard(name: "Main" , bundle: nil)
////    let initiaVC = storyboard.instantiateInitialViewController()  // 화살표로 가리키고 있는 컨트롤러를 가짐 타입케스팅을 써서 사용
//
//    let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//    show(secondVC, sender: nil)
//
////    let secondVC = SecondViewController()
////    show(secondVC, sender: nil)
//
//    //3가지 방법
////    show(secondVC, sender: nil)
////    present(secondVC, animated: true)
//    navigationController?.pushViewController(secondVC, animated: true)
  }

}

