//
//  ViewController.swift
//  PageCount
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var duck = UILabel()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    func setupUI() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .white
        }
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.setTitle("B로가기", for: .normal)
        button.addTarget(self, action:
            #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        
        let duck = UILabel(frame: CGRect(x: button.frame.maxX, y: button.frame.minY - 50, width: 200, height: 200))
        duck.text = "\(count)"
         
        duck.textColor = .red
        view.addSubview(duck)
        
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let nextVC = BViewController()
//        nextVC.modalPresentationStyle = .fullScreen //iOS12 처럼 풀 스크린= 으로 띄움
        count = count + 1
        
        //print(count)
        //nextVC.view.backgroundColor = .black
        present(nextVC, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillDidAppear")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        
    }
}

