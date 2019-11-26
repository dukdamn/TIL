//
//  BViewController.swift
//  PageCount
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupLabel()
    }
    var duck = UILabel()
    
    private func setupButton(){
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.setTitle("A로가기", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func setupLabel(){
        var duck = UILabel(frame: CGRect(x: 100, y: 150, width: 200, height: 200))
        guard let vc = presentingViewController as? ViewController else { return }
        
        duck.text = "\(vc.count)"
            //String(vc.count + 1)

        //vc.duck.text = "\(vc.count)"
        duck.center =  view.center
        duck.textColor = .red
        view.addSubview(duck)
    }
    @objc private func didTapButton(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else { return }
        vc.count += 1
        vc.duck.text = "\(vc.count)"
        
        //presentingViewController?.view.backgroundColor = .red
        //guard let vc = presentingViewController as? ViewController else { return }
        //vc.button.setTitle("여윽시~", for: .normal)
        dismiss(animated: true)
        //dismiss(animated: true) //이전화면으로 돌아감]
    }
    

}
