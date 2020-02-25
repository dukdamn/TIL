//
//  AppDelegate.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    window?.rootViewController = UINavigationController(rootViewController: MainViewController())
    window?.makeKeyAndVisible()
    return true
  }
  
  
  
}

