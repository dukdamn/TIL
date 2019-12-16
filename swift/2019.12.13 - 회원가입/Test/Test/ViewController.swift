//
//  ViewController.swift
//  Test
//
//  Created by 황정덕 on 2019/12/13.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var testView: UIView!
    @IBOutlet private weak var testView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //동그라미 하이 위드값 설정후 둥글게 만들려면 값이 같아야하고 위스나 하이값의 반만큼
        // cornerRadius 에 값을 줌
        // 바로 적용할수 없음 layer 란 속성을 다 가지고 있는데 cornerRadius 값을 주어서 모서리값을 깍음
        
        
        testView.layer.cornerRadius = 50
        testView.isHidden = false
//        testView.alpha = 0
        testView.backgroundColor = .black
        
        // 색깔 바꾸기
        testView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        
        // UIWindow - Login - Main에서
        // Login 생략시는
        
        // UIWindow - Main - Login (FullScreen)
        // 로그인을 먼저할건지 메인을 먼저할건지는 선택
        //
        
        
        
//        UIView.animate(withDuration: 3){
//
//            //true <-> galse
//            // 0 <-> 1 0.1 0.2 0.3
//            // 중간단계를 적용할수 있는것들
//            self.testView.backgroundColor = .red
//            self.testView.isHidden = false
//            self.testView2.alpha = 1      }
    }
    
    @IBAction private func didTapButton(_ sender: Any){
        
        
        
        if #available(iOS 13.0, *){
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                // 루트뷰를 바꿔준다
                window.rootViewController = SecondViewController()
                let sceneDelegate = windowScene.delegate as? SceneDelegate
                sceneDelegate?.window = window
                window.makeKeyAndVisible()
            }
        } else {
            let appDelegate =  UIApplication.shared.delegate as! AppDelegate
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = SecondViewController()
            window.makeKeyAndVisible()
            appDelegate.window = window
            
        }
    }
}

