////
////  SceneDelegate.swift
////  HelloWorld
////
////  Created by 황정덕 on 2019/11/21.
////  Copyright © 2019 Gitbot. All rights reserved.
////
//
//import UIKit
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        // Called as the scene is being released by the system.
//        // This occurs shortly after the scene enters the background, or when its session is discarded.
//        // Release any resources associated with this scene that can be re-created the next time the scene connects.
//        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Called when the scene has moved from an inactive state to an active state.
//        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Called when the scene will move from an active state to an inactive state.
//        // This may occur due to temporary interruptions (ex. an incoming phone call).
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Called as the scene transitions from the background to the foreground.
//        // Use this method to undo the changes made on entering the background.
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//    }
//
//
//}
//
// 1. SceneDelegate 사용할떄
// iOS 13 미만일 떄(현업이나 개인앱 낼 때)
// available 명시,  AppDelegate에 window 프로퍼티 추가
// @available(iOS 13, *)

// iOS 13 이상 + SceneDelegate 사용일 떄
// -> AppDelegate랑 SceneDelegate 무시


// 2. SceneDelegate 사용하지 않을 때 (AppDelegate만 사용할 떄)
// -> SceneDelegate 삭제
// -> AppDelegate에서 Scene관련 데이터 삭제
// -> Info.plist에서 Application Scene Manifest 키 샂게

// iOS 12이하일 때
// iOS 13이상일 때

// Xcode 10까지는 AppDelegate.swift
// Xcode 11부터는

