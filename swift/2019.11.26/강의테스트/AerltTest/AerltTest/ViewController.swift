//
//  ViewController.swift
//  AerltTest
//
//  Created by 황정덕 on 2019/11/26.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let countLabel =  UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 70))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Number.text = String(count)
    }
    var count = 0
    @IBOutlet weak var Number: UILabel!
    
    @IBAction private func didTapButton(_ sender: Any){
        let alertController = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .alert)
        print("Button")
        
        alertController.addTextField{ $0.placeholder = "정수 값을 입력하세요"
        }
        
        let okAction = UIAlertAction(title: "1추가", style: .default ) { _ in
            var addValue = 1
            if let textField = alertController.textFields?.first,
                let inputValue = textField.text,
                let number = Int(inputValue) {
                addValue = number
            }
            self.count += addValue
            self.Number.text = String(self.count)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "0초기호", style: .cancel ) { _ in print("Cancel 버튼")}
        alertController.addAction(cancelAction)
        
        // 위험한작업 돌이킬수 없는작업에 많이 사용
        let deleteAction1 = UIAlertAction(title: "Delete", style: .destructive ) { _ in print("Delete 버튼")}

        alertController.addAction(deleteAction1)
        present(alertController, animated: true)
    }


}



//1. 영상 파일 참고
//> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20


