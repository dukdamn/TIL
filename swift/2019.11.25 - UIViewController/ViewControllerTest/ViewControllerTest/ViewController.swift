//
//  ViewController.swift
//  ViewControllerTest
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Fullscreen Modal Presentation Style

    //
    override func viewDidLoad() {
      super.viewDidLoad()
      print("viewDidLoad")
      setupUI()
    } 
    let button = UIButton(type: .system)
    
    func setupUI() {
      if #available(iOS 13.0, *) {
        view.backgroundColor = .systemBackground
      } else {
        view.backgroundColor = .white
      }
      
      button.frame.size = CGSize(width: 100, height: 50)
      button.center = view.center
      button.setTitle("B로가기", for: .normal)
      button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      view.addSubview(button)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
      let nextVC = NectViewController()
        //nextVC.modalPresentationStyle = .fullScreen //iOS12 처럼 풀 스크린으로 띄움
        //nextVC.view.backgroundColor = .black
      present(nextVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillDidAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    

}

