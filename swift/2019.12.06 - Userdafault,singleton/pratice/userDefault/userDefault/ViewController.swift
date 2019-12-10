//
//  ViewController.swift
//  userDefault
//
//  Created by 황정덕 on 2019/12/06.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let newUserDefaults = UserDefaults()
    let singletonUserDefaults = UserDefaults.standard
    @IBOutlet weak var labelDuck: UILabel!
    @IBOutlet weak var imageDuck: UIImageView!
    
    @IBOutlet weak var switchDuck: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelDuck.text = "눌러~"
        if let duck = UserDefaults.standard.object(forKey: "dog") as? String {
            switchDuck.isOn = true
            labelDuck.text = duck
            imageDuck.image = UIImage(named: "dog")
        }
        if let duck = UserDefaults.standard.object(forKey: "cat") as? String {
            switchDuck.isOn = false
            labelDuck.text = duck
            imageDuck.image = UIImage(named: "cat")
        }
        
        switchDuck.tintColor = UIColor.orange
    }

    @IBAction func changeDuck(_ sender: UISwitch) {
        
        if sender.isOn {
            labelDuck.text = "dog"
            UserDefaults.standard.set("dog", forKey: "dog")
            imageDuck.image = UIImage(named: "dog")
            print(sender.isOn)
        } else {
            labelDuck.text = "cat"
            UserDefaults.standard.set("cat", forKey: "cat")
            imageDuck.image = UIImage(named: "cat")
            print(sender.isOn)
        }
    }
    
}

