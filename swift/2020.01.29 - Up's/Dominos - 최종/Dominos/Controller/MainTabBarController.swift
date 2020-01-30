//
//  MainTabBarController.swift
//  Dominos
//
//  Created by Lee on 2020/01/28.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let categoryVC = UINavigationController(rootViewController: CategoryTableViewController())
    categoryVC.tabBarItem = UITabBarItem(title: "Category", image: nil, tag: 0)
    
    let sectionVC = UINavigationController(rootViewController: SectionViewController())
    sectionVC.tabBarItem = UITabBarItem(title: "Section", image: nil, tag: 0)
    
    let jsonVC = UINavigationController(rootViewController: JsonViewController())
    jsonVC.tabBarItem = UITabBarItem(title: "Json", image: nil, tag: 0)
    
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, tag: 0)
    
    viewControllers = [categoryVC, sectionVC, jsonVC, wishListVC]
  }
}
