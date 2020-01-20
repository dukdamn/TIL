//
//  AppDelegate.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    FirebaseApp.configure()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
//    let signUpVC = SignUpViewController()
//    let ListVC = ListViewController()
//
//    signUpVC.tabBarItem = UITabBarItem(title: "SignUp", image: nil, tag: 0)
//    ListVC.tabBarItem = UITabBarItem(title: "List", image: nil, tag: 1)
//
//    taBar.viewControllers = [signUpVC,ListVC]
    window?.backgroundColor = .white
    window?.rootViewController = MainTabBarController()
    window?.makeKeyAndVisible()
    return true
  }


}

