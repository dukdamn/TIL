//
//  ViewController.swift
//  19.12.03Homework
//
//  Created by 황정덕 on 2019/12/03.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit
class FirstVC: UIViewController {

    @IBOutlet weak var easfsd: UILabel!
    var count = (0,0,0)
    var cat = 0
    var dog = 0
    var bird = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        easfsd.text = "(\(count.0),\(count.1),\(count.2))"

    }

    func suUI(){
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        
        guard let secondVC1 = segue.destination as? SecondVC else {
            return
        }
        if segue.identifier == "DogAction" {
            print("check")
            count.0 += 1
            easfsd.text = "(\(count.0),\(count.1),\(count.2))"
            secondVC1.duck = "DogAction"
        }else if segue.identifier == "CatAction" {
            count.1 += 1
            easfsd.text = "(\(count.0),\(count.1),\(count.2))"
            secondVC1.duck = "CatAction"
        }else if segue.identifier == "BirdAction" {
            count.2 += 1
            easfsd.text = "(\(count.0),\(count.1),\(count.2))"
            secondVC1.duck = "BirdAction"
            //var image = UIImage(named: "BirdAction")
            
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        if identifier == "DogAction" && count.0 > 9 {
            return false
        }
        if identifier == "CatAction" && count.1 > 11 {
            return false
        }
        if identifier == "BirdAction" && count.2 >= 15 {
            return false
        }
        return true
    }
    
    
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source
        let destination =  unwindSegue.destination
        print(source, destination)
    }
    
    
    @IBAction func unwindToPlusNum(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source
        let destination =  unwindSegue.destination
        print(source, destination)      //Second -> First
        // Use data from the view controller which initiated the unwind segue
        
        guard let secondVC1 = unwindSegue.source as? SecondVC else {
            return
        }
        count.0 += 1
        count.1 += 1
        count.2 += 1
        
    }

}

