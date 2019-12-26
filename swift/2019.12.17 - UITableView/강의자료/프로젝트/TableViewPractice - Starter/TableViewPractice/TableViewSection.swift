//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
   Data :  0 부터  100 사이에 임의의 숫자
   섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
   e.g.
   섹션 0 - 0부터 9까지의 숫자
   섹션 1 - 10부터 19까지의 숫자
   ***************************************************/
  
  override var description: String { "Practice 2 - Section" }
  lazy var sectionTitles: [Int] = num.keys.sorted()
  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
  //    let data = Array(1...100)
  var num: [Int: [Int]] = [:]
  var cestionTitles: [Int] = []
  
  var duckIntArray: Array<Int> = []
  override func viewDidLoad() {
    super.viewDidLoad()
    duck()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    view.addSubview(tableView)
  }
  func duck(){
    for duck in data {
      if num[duck / 10] == nil {
        duckIntArray = []
        duckIntArray.append(duck)
        num[duck / 10] = duckIntArray
      } else {
        duckIntArray = num[duck / 10] ?? [duck]
        duckIntArray.append(duck)
        num[duck / 10] = duckIntArray
      }
    }
    for duck in num {
      cestionTitles.append(duck.key)
    }
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
  //
  func numberOfSections(in tableView: UITableView) -> Int {
    num.count   
  }
  // 섹션 타이틀 가져오기
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    String(sectionTitles[section])
  }
  // 섹션안에 그것의 개수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return num [sectionTitles[section]]!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    let duckduck = num[sectionTitles[indexPath.section]]!
    cell.textLabel?.text = "\(duckduck[indexPath.row])"
    
    return cell
  }
}
