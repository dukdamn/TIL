//
//  SecondViewController.swift
//  MyAlertControllerStoryBoard
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit
enum UnwindType{
    case cancel
    case enter
}
class SecondViewController: UIViewController {
    
    var duck: UnwindType!
    @IBOutlet weak var contentTextField: UITextField!
}
