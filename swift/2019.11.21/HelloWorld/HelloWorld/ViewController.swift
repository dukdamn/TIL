//
//  ViewController.swift
//  HelloWorld
//
//  Created by 황정덕 on 2019/11/21.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var duk: UIView!
    @IBOutlet weak var duckduck: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duk.backgroundColor = .black
        duk.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        duk.addSubview(duk)
//        let blueView = UIView()
//        blueView.backgroundColor = .systemBlue
//        blueView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        blueView.center = view.center
//        view.addSubview(blueView)           //블루뷰를 추가해주겠다
        // Do any additional setup after loading the view.
        duckduck.setTitle("눌렁", for: .normal)
        
        
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        print("버튼이 눌렸습니다")
    }
    
}
