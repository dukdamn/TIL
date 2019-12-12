//
//  ViewController.swift
//  2019.12.10 - Homework
//
//  Created by 황정덕 on 2019/12/10.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate : class {
    func duckaaa(_ textField: String)
}

class FirstViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    weak var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let secondVC = segue.destination as! SecondViewController
        print(segue.identifier)
        if segue.identifier == "go1" {
            self.delegate = secondVC
            delegate?.duckaaa(textField.text!)
        } else if segue.identifier == "go2" {
            secondVC.delegate?.duck()
        }
        
    }

    @IBAction func unwindTodDismiss(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }

}

extension FirstViewController : SecondViewControllerDelegate {
    func duck() {
    }
}
//protocol FirstViewControllerDelegate {
//  func 어떤 함수1
//}
//class FirstViewController {
//  var delegate: FirstViewControllerDelegate?
//  delegate?.어떤 함수1()   // 어느 시점에서 실행
//}
//FirstViewController:  SecondViewControllerDelegate {
//  // 코드
//}

//protocol SecondViewControllerDelegate {
//  func 어떤 함수2
//}
//class SecondViewController {
//  var delegate:  SecondViewControllerDelegate?
//  delegate?.어떤 함수2()   // 어느 시점에서 실행
//}
//extension SecondViewController: FirstViewControllerDelegate  {
//  // 코드
//}
