//
//  ViewController.swift
//  segue
//
//  Created by 황정덕 on 2019/12/03.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //화면전환과정에서 무언가 해줄 메서드 넘아가는 전제하에
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        segue.destination  //목적지 SecondVC
        segue.source       //출발지 FirstVC
        segue.identifier   //Card, FullScreen
        print(segue.description)
        print(segue.source)
        print(segue.identifier)
        
        //다음 도착지가 세컨드컨트롤러인지 확인하고 가야댐
        
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        if segue.identifier == "Card" {
            count += 1
            secondVC.count = count
        }else {
            count += 10
            secondVC.count = count
        }
         
    }
    // ActiionSegue : ShouldPerform -> Prepare
    // ManualSegue : PerformSegue -> prepare
    @IBAction private func didTapPlusFiveButton(_ sender: Any){
        if count < 20 {
            performSegue(withIdentifier: "PlusFive", sender: sender)
        }
        
    }
    
    //화면전환을 안되게끔 하는것 처음부터 넘어갈지 결정
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
            // count 값이 40이 넘어가면 화면전환이 안 되게 하고
            // 25 + 10 = 45
    //        identifier
    //        if let duck = identifier == "Card" ? 1 : 10{
    //            return count + duck < 40
    //        }
            if identifier == "Card" && count >= 39 {
                return false
            }
            if identifier == "FullScreen" && count >= 30 {
                return false
            }
            return true
        }
    
    //
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source
        let destination =  unwindSegue.destination
        print(source, destination)      //Second -> First
        // Use data from the view controller which initiated the unwind segue
        
        guard let secondVC = unwindSegue.source as? SecondViewController else {
            return
        }
        count -= secondVC.minus
        
        
    }

    
    
    @IBAction func unwindToReset(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source
        let destination =  unwindSegue.destination
        print(source, destination)      //Second -> First
        // Use data from the view controller which initiated the unwind segue
        
        guard let secondVC = unwindSegue.source as? SecondViewController else {
            return
        }
        count = 0
        // Use data from the view controller which initiated the unwind segue
    }
    
}

