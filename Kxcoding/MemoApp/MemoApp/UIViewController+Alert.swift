//
//  UIViewController+Alert.swift
//  MemoApp
//
//  Created by 황정덕 on 2020/01/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit


extension UIViewController {
  func alert(title: String = "알림", maggage: String) {
    let alert = UIAlertController(title: title, message: maggage, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(okAction)
    
    present(alert, animated: true, completion: nil)
  }
}
