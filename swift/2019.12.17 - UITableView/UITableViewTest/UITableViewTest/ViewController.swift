//
//  ViewController.swift
//  UITableViewTest
//
//  Created by 황정덕 on 2019/12/17.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit
// 1. 데이터소스를 구현
// 2. 함수 구현
// 3. dataSource 에 self 줌
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    


}

extension ViewController: UITableViewDataSource {
    // 하나의 섹션에 몇개의 로우(행) 이 들어갈지 정함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50   // 열개의 행을 테이블뷰로 표현
    }
    // 테이블 뷰에 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: "CellID")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
        
        
        
        
        
////        indexPath.section   // 몇번째 섹션인지
////        indexPath.row       // 몇번째 로우인지
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
    }
}
