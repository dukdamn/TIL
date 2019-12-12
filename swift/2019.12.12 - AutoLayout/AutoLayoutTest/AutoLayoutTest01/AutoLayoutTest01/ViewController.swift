//
//  ViewController.swift
//  AutoLayoutTest01
//
//  Created by 황정덕 on 2019/12/12.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var duckTop: CGFloat = 0
    var duckBottom: CGFloat = 0
    var reftView = UIView()
    var rightView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        print("viewDidLoad :", UIApplication.shared.statusBarFrame)
//        print(view.safeAreaInsets.top)
//        view.safeAreaInsetsDidChange()
//        print(view.safeAreaInsets)
        
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        print(view.safeAreaInsets)
//        reftView.frame = CGRect(x: Int(view.safeAreaInsets.top),
//        y: Int(view.safeAreaInsets.bottom),
//        width: Int(view.frame.width) / 2,
//        height: Int(view.frame.height))
        
        reftView.frame = CGRect(x: 10,
                                y: view.safeAreaInsets.top + view.safeAreaInsets.left,
                                width: view.frame.width/2,
                                height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.top)
        
        
        
        reftView.backgroundColor = .red
        view.addSubview(reftView)
        
//        rightView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        rightView.backgroundColor = .green
        view.addSubview(rightView)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        print(view.safeAreaInsets.top)
//        print(view.safeAreaInsets.bottom)
//        duckTop = view.safeAreaInsets.top
//        duckBottom = view.safeAreaInsets.bottom
    }
}



/*
 viewWillAppear
 -> viewSafeAreaInsetsDidChange
 -> viewWillLayoutSubviews
 (View) LayoutSubViews
 -> viewDidoutSubbiews
 -> viewDidAppear
 */
