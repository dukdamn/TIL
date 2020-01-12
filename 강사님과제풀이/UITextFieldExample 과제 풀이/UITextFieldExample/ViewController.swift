//
//  ViewController.swift
//  UITextFieldExample
//
//  Created by 이봉원 on 20/11/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBAction func editingDidBegin(_ sender: UITextField) {
    label.textColor = .blue
    label.font = UIFont.systemFont(ofSize: 40)
  }
  
  @IBAction func editingChanged(_ sender: UITextField) {
    label.text = sender.text
  }
  
  @IBAction func editingDidEnd(_ sender: UITextField) {
    label.textColor = .red
    label.font = UIFont.systemFont(ofSize: 20)
  }
  
  @IBAction func didEndOnExit(_ sender: Any) {
  }
}

extension ViewController: UITextFieldDelegate {
}
