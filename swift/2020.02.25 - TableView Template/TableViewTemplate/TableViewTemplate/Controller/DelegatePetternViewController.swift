//
//  DelegatePetternViewController.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class DelegatePetternViewController: UIViewController {
  
  // MARK: Property
  override var description: String {
    self.title = "Delegate Pettern"
    return "Delegate Pettern"
  }
  let list = ["iPhone", "iPad", "Apple Watch", "iMac Pro", "iMac 5K", "Macbook Pro", "Apple TV"]
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableView
  }()
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableViewSetUI()
  }
  
  // MARK: - setUI
  private func tableViewSetUI() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
}
// MARK: - UITableViewDataSource
extension DelegatePetternViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = list[indexPath.row]
    return cell
  }
}
