//
//  ViewController.swift
//  buttonUpDown
//
//  Created by 황정덕 on 2019/11/21.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num = 0
    @IBOutlet weak var number: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func minus(_ sender: Any) {
        num = Int(number.text ?? "0")!
        num -= 1
        number.textColor = .red
        number.text = String(num)
        
        
    }
    @IBAction func plus(_ sender: Any) {
        num = Int(number.text ?? "0")!
        num += 1
        number.textColor = .blue
        number.text = String(num)
    }
}

