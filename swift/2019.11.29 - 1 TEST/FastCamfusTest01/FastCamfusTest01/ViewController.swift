//
//  ViewController.swift
//  FastCamfusTest01
//
//  Created by 황정덕 on 2019/11/29.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var aButton: UIButton = UIButton()
    var bButton: UIButton = UIButton()
    
    var aLabel: UILabel = UILabel()
    var bLabel: UILabel = UILabel()
    
    var cLabel: UILabel = UILabel()
    var dLabel: UILabel = UILabel()
    
    @IBOutlet weak var countZzaZza: UILabel!
    
    @IBOutlet weak var countJjamBong: UILabel!
    
    @IBOutlet weak var countTangsu: UILabel!
    
    var countZza = 0
    var countJjam = 0
    var countTang = 0
    
    var myMoney = 70000
    var totalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superUi()
        // Do any additional setup after loading the view.
    }
    
    private func superUi(){
        
        aLabel.text = "소지금"
        aLabel.backgroundColor = .green
        aLabel.center = view.center
        aLabel.textAlignment = .center
        aLabel.frame = CGRect(x: 30, y: 350, width: 80, height: 40)
        view.addSubview(aLabel)
        
        bLabel.text = "결제금액"
        bLabel.backgroundColor = .brown
        bLabel.center = view.center
        bLabel.textAlignment = .center
        bLabel.frame = CGRect(x: 30, y: 440, width: 80, height: 40)
        view.addSubview(bLabel)
        
        cLabel.text = String(myMoney)
        cLabel.backgroundColor = .green
        cLabel.center = view.center
        cLabel.textAlignment = .right
        cLabel.frame = CGRect(x: 150, y: 350, width: 140, height: 40)
        view.addSubview(cLabel)
        
        dLabel.text = String(totalPrice)
        dLabel.backgroundColor = .brown
        dLabel.center = view.center
        dLabel.textAlignment = .right
        dLabel.frame = CGRect(x: 150, y: 440, width: 140, height: 40)
        view.addSubview(dLabel)
        
        
        aButton.setTitle("초기화", for: .normal)
        aButton.backgroundColor = .black
        aButton.center = view.center
        aButton.frame = CGRect(x: 300, y: 350, width: 100, height: 40)
        aButton.addTarget(self, action: #selector(aButtonAction), for: .touchUpInside)
        view.addSubview(aButton)
        
        bButton.setTitle("결제", for: .normal)
        bButton.backgroundColor = .black
        bButton.center = view.center
        bButton.frame = CGRect(x: 300, y: 440, width: 100, height: 40)
        bButton.addTarget(self, action: #selector(bButtonAtction), for: .touchUpInside)
        view.addSubview(bButton)
    }
    
    @objc private func aButtonAction(){
        countZza = 0
        countJjam = 0
        countTang = 0
        myMoney = 70000
        totalPrice = 0
        countZzaZza.text = String(countZza)
        countJjamBong.text = String(countJjam)
        countTangsu.text = String(countTang)
        cLabel.text = String(myMoney)
        dLabel.text = String(totalPrice)
    }
    @objc private func bButtonAtction(){
        print(totalPrice)
        let alertController = UIAlertController(title: "결제하기", message: "총 결제금액은 \(totalPrice)입니다", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default ) { _ in
            if self.myMoney >= self.totalPrice {
                self.myMoney -= self.totalPrice
                self.countZza = 0
                self.countJjam = 0
                self.countTang = 0
                self.totalPrice = 0
                self.countZzaZza.text = String(self.countZza)
                self.countJjamBong.text = String(self.countJjam)
                self.countTangsu.text = String(self.countTang)
                self.cLabel.text = String(self.myMoney)
                self.dLabel.text = String(self.totalPrice)
            }else {
                let alertController1 = UIAlertController(title: "오류", message: "소지금액이 부족합니다", preferredStyle: .alert)
                let errorAction = UIAlertAction(title: "확인", style: .cancel ) { _ in }
                alertController1.addAction(errorAction)
                self.present(alertController1, animated: true)
            }
        }
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel ) { _ in }
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func upZzaZza(_ sender: Any) {
        countZza += 1
        totalPrice += 5000
        countZzaZza.text = String(countZza)
        dLabel.text = String(totalPrice)
    }
    
    @IBAction func upJjamBong(_ sender: Any) {
        countJjam += 1
        totalPrice += 6000
        countJjamBong.text = String(countJjam)
        dLabel.text = String(totalPrice)
    }
    
    @IBAction func upTangsu(_ sender: Any) {
        countTang += 1
        totalPrice += 12000
        countTangsu.text = String(countTang)
        dLabel.text = String(totalPrice)
    }
    

}

