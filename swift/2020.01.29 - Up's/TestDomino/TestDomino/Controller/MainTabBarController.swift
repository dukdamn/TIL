//
//  MainTabBarController.swift
//  TestDomino
//
//  Created by 황정덕 on 2020/01/29.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let sectnionVC = UINavigationController(rootViewController: SectionViewController())
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    let categoryVC = UINavigationController(rootViewController: CategoryTableViewController())
    let jsonVC = UINavigationController(rootViewController: JasonViewController())
    categoryVC.tabBarItem = UITabBarItem(title: "Category", image: nil, tag: 0)
    sectnionVC.tabBarItem = UITabBarItem(title: "Section", image: UIImage(named: "domino's"), tag: 1)
    wishListVC.tabBarItem = UITabBarItem(title: "WishList", image: nil, tag: 2)
    jsonVC.tabBarItem = UITabBarItem(title: "Json", image: nil, tag: 3)
    viewControllers = [categoryVC, sectnionVC, wishListVC, jsonVC]
  }
  
  
  
}
