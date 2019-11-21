//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by 황정덕 on 2019/11/21.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit
//Top level

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?      //SceneDelegate를 사용안하려고 적용

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }
    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillRestignActive")
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackgroun")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    func applicationWillTerminate(_ application: UIApplication) {
        print("willTerminate")
    }
}

