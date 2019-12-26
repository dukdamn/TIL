//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
  
  override var description: String { "TableView - CellStyle" }
  
  /***************************************************
   셀 스타일 4가지 (default, subtitle, value1, value2)
   ***************************************************/
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 70
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
    
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CallId")
    // 오토메틱 오토레이아웃 기준으로 크기가 결점됨 11이전에는 44 값이 기존
    // 전체 높이를 일괄적으로 고정 시킴
    tableView.rowHeight = UITableView.automaticDimension  // 최정적으로 꾸며질 값
    // estunatedRiwHeight 대략적으로 크기 결정 의석한테 물어보기
    tableView.estimatedRowHeight = UITableView.automaticDimension

  }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // 재사용
    let cell: UITableViewCell
    
    if indexPath.row % 4 == 0 {
      // 셀 재사용 시도 후 없으면 생성
      cell = tableView.dequeueReusableCell(withIdentifier: "Default")
        ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
    } else if indexPath.row % 4 == 1 {
      cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
    } else if indexPath.row % 4 == 2 {
      cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
        ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "Value2")
        ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")
    }
    
    // 공통 속성 세팅
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.detailTextLabel?.text = "ABCD"
    cell.imageView?.image = UIImage(named: "bear")
    cell.accessoryType = .checkmark
    return cell
  }
}



extension TableViewCellStyle: UITableViewDelegate{
  // 원하는 셀의 크기를 선택해 변경시켜줄때 사용
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row % 4 == 0 {
      return 120
    } else {
      return 50
    }
  }
}
