//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
  
  /***************************************************
   테이블뷰 목록 수정하기 (insert, delete 등)
   ***************************************************/
  
  override var description: String { "TableView - Editing" }
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  @objc func switchToEditing() {
    // e
    // edit 누른 상태에서 에딧상태를 반대로 해서
    tableView.setEditing(!tableView.isEditing, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .none: print("none")
    case .delete:
      data.remove(at: data.firstIndex(of: data[indexPath.row])!)
      tableView.deleteRows(at: [indexPath], with: .automatic)
      print("delete",indexPath)
    case .insert:
      data.insert((1..<51).randomElement()!, at: indexPath.row)
      tableView.insertRows(at: [indexPath], with: .automatic)
//      data.remove(at: data.firstIndex(of: data[indexPath.row + 1])!)
//      reloadData()
      print("insert")
    default: print("default")
    }
  }
  
  
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
  // 각 인데스 패스를 값을 받아 edit 사용할지 말지를 함
//  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//    indexPath.row.isMultiple(of: 2)
//  }
  
  // editingstyle 반환
//  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//    let row = indexPath.row
//    if row % 3 == 0{
//      return .none
//    } else if row % 3 == 1 {
//      return .delete
//    } else {
//      return .insert
//    }
//  }
  
  
  
  
  
//  // iOS 8이상 ~ 10까지
//  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//    return [UITableViewRowAction(style: .default, title: "adfs"){
//      }]
//  }
  
  
  
  // iOS 11 이상 버젼에서만 가능
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    print("trailingSwipeActionsConfigurationForRowAt")
    let addAction = UIContextualAction(style: .normal, title: "Add"){
      (action, sourceView, actionPerformed) in
      print("Add Action")
      actionPerformed(true)
    }
    addAction.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
      (action, sourceView, actionPerformed) in
      print("Add Action")
      actionPerformed(true)
    }
    
    let configuration = UISwipeActionsConfiguration(actions: [deleteAction,addAction])
    configuration.performsFirstActionWithFullSwipe = false
    return configuration
  }
}

