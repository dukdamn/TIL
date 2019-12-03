//
//  SecondViewController.swift
//  segue
//
//  Created by 황정덕 on 2019/12/03.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textNum: UITextField!
    var texa = "가즈아~"
    var count: Int = 0
    var minus = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(count)

    }
    
    
    @IBAction func gitveNum(_ sender: UITextField) {
        guard let num = Int(sender.text ?? "0" ) else { return }
        minus = num
    }
    
    
    
    
    
}
