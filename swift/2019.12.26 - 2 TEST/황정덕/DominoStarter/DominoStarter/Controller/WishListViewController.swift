//
//  WishListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
  var last: [MenuDetail]?
  private let userData = UserData.main
  private let tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // Do any additional setup after appearing the view.
    tableView.reloadData()
    
  }
  
  private func setupUI() {
    self.view.backgroundColor = .white
    self.navigationItem.title = "WishList"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(deleteList(_:)))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(order(_:)))
    
    tableView.dataSource = self
    tableView.rowHeight = 100
    self.view.addSubview(tableView)
    
    setupConstraint()
  }
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
  
  // MARK:- Action
  
  @objc private func deleteList(_ sender: UIBarButtonItem) {
    userData.removeAll()
    tableView.reloadData()
  }
  
  @objc private func order(_ sender: UIBarButtonItem) {
    last = userData.getMenuDetail()
    if let duck = last {
      var sum = 0
      for check in duck {
        sum += check.price * check.ordered
      }
      let alertController = UIAlertController(title: "결제금액", message:
        "총액은 \(sum)입니다" , preferredStyle: .alert)
      let okAction = UIAlertAction(title: "결제하기", style: .default ) { _ in
        self.userData.removeAll()
        self.tableView.reloadData()
      }
      alertController.addAction(okAction)
      let cancelAction = UIAlertAction(title: "돌아가기", style: .cancel ) { _ in }
      alertController.addAction(cancelAction)
      present(alertController, animated: true)
    } else {
      
    }
    
    
  }
}


// MARK:- UITableViewDataSource

extension WishListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userData.numberOfData
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let menuCell = tableView.dequeueReusableCell(withIdentifier: "WishListCell") {
      cell = menuCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "WishListCell")
    }
    
    let data = userData.fetch(at: indexPath.row)
    cell.imageView?.image = UIImage(named: data.name)
    cell.textLabel?.text = data.name
    cell.detailTextLabel?.text = "\(data.ordered) 개"
    return cell
  }
}
