//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    
    // 별도의 identifier를 등록을 해줘야함 //타입전체를 보낼떄는 self로 보냄
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
//    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "CellID")
  }
}

extension TableViewBasic: UITableViewDataSource {
    // 하나의 섹션에 몇개의 로우(행) 이 들어갈지 정함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50   // 열개의 행을 테이블뷰로 표현
    }
    // 테이블 뷰에
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1) 매번 새로운 cell 생성
//        let cell =  UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        // 2) 재사용 - 미등록.                                          코드가 너무 큼
//        let cell: UITableViewCell
//        // 아이디만 적어주는
//        // 테이블 뷰에 접근해서 아이덴
//        // 식별자가 있으면 셀에다가 리쥬어블 셀을 넣고
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID"){
//            print("duck")
//            cell = reusableCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID") // 샐을 등록
//            print("새로생성")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//                return cell
        
      // 재사용 - 선등록후
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
}


