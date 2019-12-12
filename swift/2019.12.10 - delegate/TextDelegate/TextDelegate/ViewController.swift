//
//  ViewController.swift
//  TextDelegate
//
//  Created by 황정덕 on 2019/12/10.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet private weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    // red, blue , black // gray

}

extension ViewController: UITextFieldDelegate{
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드를 내리기위해선 코드를 추가하여야댐
        textField.resignFirstResponder()
        if textField.text == "red" {
            myView.backgroundColor = .red
        }else if textField.text == "blue" {
            myView.backgroundColor = .blue
        }else if textField.text == "black" {
            myView.backgroundColor = .black
        }else {
            myView.backgroundColor = .gray
        }
        return false
        
    }
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacemenString string: String) -> Bool {
        print(string)
        
        return string == "a" ? false : true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
