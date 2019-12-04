//
//  AppDelegate.swift
//  ViewControllerTest
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //루트뷰로 연결
        if #available(iOS 13.0, *){ //버젼에 맞게 적용해줘야 좋다
            
        }else{
            //코드로 하려면 여기에 윈도우를 넣어줘야댐
            window = UIWindow(frame: UIScreen.main.bounds)      //스크린의 크기만큼 바운즈로 잡음
            window?.backgroundColor = .white
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
        }
        
                        
        return true
    }

    //iOS13에서만 사용 밑에꺼
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

