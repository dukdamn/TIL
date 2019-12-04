//
//  NectViewController.swift
//  ViewControllerTest
//
//  Created by 황정덕 on 2019/11/25.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class NectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print("-------[NviewDidLoad]-------")
        
        setupButton()
        setupButton1()
        //isModalInPresentation = true      //무조건 내리지 못하게함
        //presentationController?.delegate = self   //상황에 따라 못하게함  
        
    }
    let button = UIButton(type: .system)
    private func setupButton(){
        
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        button.setTitle("A로가기", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    private func setupButton1(){
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.frame = CGRect(x: 250, y: 300, width: 100, height: 50)
        button.setTitle("C로가기", for: .normal)
        button.addTarget(self, action: #selector(didTapButton1(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        /*********************************************/
        //presentingViewController     - 내가 띄운 뷰컨트롤러
        //presentedViewController      - 나를 띄운 뷰컨트롤러
        print(presentingViewController )         // viewcontroller
        print(presentedViewController )          // nil
        print(presentingViewController?.presentedViewController)
        // self
        // self.presentingViewController    //뷰 컨트롤러
        // self.presentingViewController?.presentedViewController //nectvc
        //presentingViewController?.view.backgroundColor = .red
        guard let vc = presentingViewController as? ViewController else { return }
        vc.button.setTitle("여윽시~", for: .normal)
        presentingViewController?.dismiss(animated: true)
        //dismiss(animated: true) //이전화면으로 돌아감]
    }
   @objc private func didTapButton1(_ sender: UIButton) {
      let nextVC = NextViewController()
        //nextVC.modalPresentationStyle = .fullScreen //iOS12 처럼 풀 스크린으로 띄움
        //nextVC.view.backgroundColor = .red
      present(nextVC, animated: true)
   }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NviewDidAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NviewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NviewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NviewDidDisappear")
    }
    //제대로 없어지는지 확인하는법
    //소멸자
    deinit {
        print("-------[deinit]-------")
    }

}
