//
//  ViewController.swift
//  DynamicAutoLayoutTest
//
//  Created by 황정덕 on 2019/12/16.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var CenterXConstraint: NSLayoutConstraint!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //1. constant, multiplier 변경
//        CenterXConstraint.constant = 100
        
        //2. 우선순위 변경 (999)
//        CenterXConstraint.priority = .defaultLow // 750
//        CenterXConstraint.priority = .required
        
        //3. isActive 의 true false 로 우선순위 결정
//        CenterXConstraint.constant = 100
//        // isActive 는 그것의 제약조건을 다 삭제한다
//        CenterXConstraint.isActive = false  // RC -1
        
        
   
        
    }
    //프래임 변경시 적용
    override func viewWillLayoutSubviews() {
        
    }
    override func viewDidLayoutSubviews() {
        
    }
    //오토레이아웃 변경시 적용
    override func updateViewConstraints() {
        
    }
    var toggle = false
    @IBAction private func didTapButton(_ sender: Any){
        //view.setNeedsLayout() -> 레이아웃이 필요해 true
        //layoutIfNeeded() -> 레이아웃 필요 true -> layout을 지금 당장 수행해
        
        if toggle {
            UIView.animate(withDuration: 1, animations: {
            self.CenterXConstraint.constant = 100 //view.setNeedsLayouy()
            //런루프를 기다리거나 안기다리거나
            self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
            self.CenterXConstraint.constant = -100
            self.view.layoutIfNeeded()
            })
        }
        toggle.toggle()
    }
}

