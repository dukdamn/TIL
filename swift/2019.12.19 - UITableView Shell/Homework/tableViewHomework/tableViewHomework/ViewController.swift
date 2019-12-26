//
//  ViewController.swift
//  tableViewHomework
//
//  Created by 황정덕 on 2019/12/19.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let tableView = UITableView()
  var duck: [Int : Int] = [:]
  var data = Array(1...20)
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 60
    view.addSubview(tableView)
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
  }
  
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  
  // 어떤셀을 쓸것인지나 라벨을 줄것인지만 가능하고 안에대한 레이아웃등의 설정은 커스텀뷰 안에서 설정
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
    (cell as! CustomCell).contentView.tag = indexPath.row
    print(cell.frame.height)  // 기본값은 44.0
    
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
    
  }
  
}

extension ViewController: UITableViewDelegate {

}
