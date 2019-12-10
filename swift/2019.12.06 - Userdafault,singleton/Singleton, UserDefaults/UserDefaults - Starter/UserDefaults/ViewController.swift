//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2019. 11. 20..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    print(datePicker.date)
    print(datePicker.locale)
    print(datePicker.date.customMirror)
    print(datePicker.date.description)
    print(datePicker.date.debugDescription)
    
  }
  
  @IBAction func loadData(_ button: UIButton) {

  }
}

