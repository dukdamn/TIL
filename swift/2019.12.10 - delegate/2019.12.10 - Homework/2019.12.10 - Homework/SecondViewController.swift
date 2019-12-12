//
//  SecondViewController.swift
//  2019.12.10 - Homework
//
//  Created by 황정덕 on 2019/12/10.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate {
    func duck()
}

class SecondViewController: UIViewController {
    
    var duck1: String = ""
    @IBOutlet weak var textLabel: UILabel!
    var delegate: SecondViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = duck1
    }
    
    
}


extension SecondViewController : FirstViewControllerDelegate {

    func duckaaa(_ textField: String){
        self.duck1 = textField
       
    }
}
