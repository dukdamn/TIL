//
//  AppDelegate.swift
//  PageCount
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *){
            
        }else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .darkGray
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
        }
        
        return true
    }


}

