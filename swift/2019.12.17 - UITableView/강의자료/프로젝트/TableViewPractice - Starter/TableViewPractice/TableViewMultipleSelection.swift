//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
  
  /***************************************************
   [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
   
   1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
   2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
   랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
   (여기까지 TableViewRefresh 실습 내용과 동일)
   3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
   (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
   e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
   4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
   
   < 힌트 키워드 >
   willSelectRowAt - tableViewDelegate 참고, 선택 가능 여부
   selectedRow(s) - tableView 속성, 현재 선택된 행에 대한 정보
   multipleSelection - 다중 선택 가능 여부
   ***************************************************/
  
  override var description: String {
    return "Task 1 - MultipleSelection"
  }
  
  let tableView = UITableView()
  let maxCount = 20
  let maxRange = 50
  lazy var data = Array(1...maxCount)
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    
    tableView.allowsMultipleSelection = true
  }
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    view.addSubview(tableView)
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  @objc func reloadData() {
    print(tableView.indexPathsForSelectedRows)
    var changeArr: [Int] = []
    var getArr: [Int] = []
    if let duck = tableView.indexPathsForSelectedRows {
      for i in duck{
        changeArr.append(i[1])
      }
      for i in changeArr {
        getArr.append(data[i])
      }
      data.removeAll()
      for i in getArr {
        data.append(i)
      }
      for _ in 1...maxCount - changeArr.count {   // 20
        data.append(generateRandomNumber())
      }
      tableView.refreshControl?.endRefreshing()
      tableView.reloadData()
    }else {
      data.removeAll()
      for _ in 1...maxCount {   // 20
        data.append(generateRandomNumber())
      }
      tableView.refreshControl?.endRefreshing()
      tableView.reloadData()
    }
  }
  
  func generateRandomNumber() -> Int {
    #if swift(>=4.2)
    let randomNumber = (0..<maxCount + maxRange).randomElement()!
    #else
    let randomNumber = Int(arc4random_uniform(UInt32(maxCount + maxRange)))
    #endif
    guard !data.contains(randomNumber) else { return generateRandomNumber() }
    return randomNumber
  }
}


// MARK: - UITableViewDataSource

extension TableViewMultipleSelection: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    guard data[indexPath.row] > 7 else { return nil }
    return indexPath
    //    return indexPath(row: indexPath.row + 10, section: 0)
    //    print(tableView.indexPathsForSelectedRows)
    //    print(indexPath)
    //    switch indexPath.row {
    //    case 0,1,2:
    //      return nil
    //    default:
    //      return indexPath
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    <#code#>
  }
}

//    extension TableViewMultipleSelection: {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return data.count
//  }
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//    cell.textLabel?.text = "\(data[indexPath.row])"
//    return cell
//  }
//}
