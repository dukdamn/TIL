//
//  MainTabBarController.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//


import UIKit
class MainTabBarController: UITabBarController {
  
  private let signUpVC = SignUpViewController()
  private let listVC = ListViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    signUpVC.tabBarItem = UITabBarItem(title: "SignUp", image: nil, tag: 0)
    listVC.tabBarItem = UITabBarItem(title: "List", image: nil, tag: 1)
    viewControllers = [signUpVC, listVC]
//    self.delegate = self
  }
}
//extension MainTabBarController: UITabBarControllerDelegate {
//  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//    if viewController == tempVC {
//      present(listVC, animated: true)
//      return false
//    }
//    return true
//  }
//}
