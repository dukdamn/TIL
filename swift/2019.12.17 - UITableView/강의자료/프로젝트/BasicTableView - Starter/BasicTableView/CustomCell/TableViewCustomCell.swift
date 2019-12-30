//
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
  
  /***************************************************
   커스텀 셀 사용하기
   ***************************************************/
  
  override var description: String { "TableView - CustomCell" }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 80
    view.addSubview(tableView)
    
    // UITableViewCell (홀수행), CustomCell (짝수행)
    // 등록하는 방법
    tableView.register(UITableViewCell.self , forCellReuseIdentifier: "Default")
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
  }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  
  // 어떤셀을 쓸것인지나 라벨을 줄것인지만 가능하고 안에대한 레이아웃등의 설정은 커스텀뷰 안에서 설정
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if indexPath.row.isMultiple(of: 2) {
      // 커스텀의 셀의경우 타입캐스팅을 통해서 UITableViewCell 로 타입케스팅함
      cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
      (cell as! CustomCell).myLabel.text = "ABCDE"
//      print(cell.frame.height)  // 기본값은 44.0
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
    }
    cell.textLabel?.text = "\(indexPath.row)"
    cell.imageView?.image = UIImage(named: "bear")
    
    
    
    
//    if indexPath.row.isMultiple(of: 2) {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomCell
//      cell.myLabel.text = "ABCD"
//    } else {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
//    }
    
    
    
    // 물어보기 이거 쓰면안댐
    // 아무것도 안만들어졌을때 생성하게 되면 이게 없으면 커스텀을 만드는데
//    if let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? CustomCell {
//      cell.myLabel.text = "ADFS"
//      return cell
//    } else {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
//      return cell
//    }
    // 어떤차이가 명확한지 알아두기
    return cell
    
    
  }
}

// MARK: - UITableViewDelegate
// 호출 순서 : cellForRowAt -> willDisplayCell -> layoutSubviews
extension TableViewCustomCell: UITableViewDelegate {
  // 화면에대한 설정
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let customCell = cell as? CustomCell else {
      return
    }
    customCell.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
    print("willDisplayCell")
  }
}


// 테이블뷰 사용방법 두개
