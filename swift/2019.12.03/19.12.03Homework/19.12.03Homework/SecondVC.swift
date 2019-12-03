//
//  SecondVC.swift
//  19.12.03Homework
//
//  Created by 황정덕 on 2019/12/03.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var imagDuck: UIImageView!
    var duck: String = ""
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        //var image = UIImage(named: duck)
        print(duck)
        imagDuck.image = UIImage.init(named: duck)
        
    }
    
    
    
    
    
}
