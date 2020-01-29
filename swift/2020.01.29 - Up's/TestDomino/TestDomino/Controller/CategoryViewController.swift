//
//  CategoryViewController.swift
//  TestDomino
//
//  Created by 황정덕 on 2020/01/29.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  private let tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationSet()
    configure()
    autoLayout()
  }
  private func navigationSet() {
    title = "Domino's"
  }
  private func configure() {
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    // 체크
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    let product = menuData[indexPath.row]
    cell.imageView?.image = UIImage(named: product.category)
//    cell.selectionStyle = .none
    
    return cell
  }
  
}
extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
//    view.frame.wi
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let herderView = UIImageView()
    herderView.backgroundColor = .white
    herderView.image = UIImage(named: "logo")
    herderView.contentMode = .scaleAspectFit
    return herderView
  }
}
