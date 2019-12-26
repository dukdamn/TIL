//
//  SecondViewController.swift
//  NabigationControllerTest
//
//  Created by 황정덕 on 2019/12/23.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    navigationController?.popViewController(animated: true)
    // 최초의 루트뷰로 가는 방법
    navigationController?.popToRootViewController(animated: true)
  }

}
