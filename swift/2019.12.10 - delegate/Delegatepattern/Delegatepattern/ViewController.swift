//
//  ViewController.swift
//  Delegatepattern
//
//  Created by 황정덕 on 2019/12/10.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.backgroundColor = .systemBlue
        myView.backgroundColor = .red // -> blue
        myView.backgroundColor = nil // -> black
        
        // 2. delegate = self
        myView.delegate = self
        
        myView.backgroundColor = .red
        
        
        //        myView.backgroundColor = .blue
        //        print("새로변경될 색은 : ", myView.backgroundColor!)
        
    }
    
    //    func printColor(color: UIColor){
    //        myView.backgroundColor = color
    //        print("새로변경될 색은 : ", myView.backgroundColor!)
    //    }
    
    
}

// 1. Delegate 프로토콜 채택
extension ViewController: CustomViewDelegate{
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else {
            return .black
        }
        return color == .red ? .blue : color
    }
    

}
