//
//  MultiSectionTableViewController.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class MultiSectionTableViewController: UIViewController {
  let list = PhotosSettingSection.generateData()
  override var description: String {
    self.title = "Multi Section"
    return "Multi Section"
  }
  
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailTitle")
    tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "switch")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "checkmark")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableHeaderView?.backgroundColor = .white
    
    return tableView
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableViewSetUI()
  }
  
  @objc func switchChanged(_ sender: UISwitch){
    print(sender.isOn, sender.tag)
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

extension MultiSectionTableViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    list.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    list[section].items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let target = list[indexPath.section].items[indexPath.row]
    switch target.type {
    case .detailTitle:
      let cell1 = UITableViewCell(style: .subtitle, reuseIdentifier: target.type.rawValue)
      //      UITableViewCell(style: .subtitle, reuseIdentifier: <#T##String?#>)
      //      UITableViewCell(style: <#T##UITableViewCell.CellStyle#>, reuseIdentifier: <#T##String?#>)
      cell1.textLabel?.text = target.title
      cell1.detailTextLabel?.text = target.subTitle
      cell1.imageView?.image = UIImage(named: target.imageName! )
      return cell1
    case .switch:
      let cell2 = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! SwitchTableViewCell
      cell2.textLabel?.text = target.title
      if let swithchView = cell2.accessoryView as? UISwitch {
        swithchView.isOn = target.on
        swithchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        swithchView.tag = indexPath.section
      }
      return cell2
    case .checkmark:
      let cell3 = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! UITableViewCell
      //      UITableViewCell.CellStyle
      cell3.textLabel?.text = target.title
      cell3.accessoryType = target.on ? .checkmark : .none
      return cell3
    }
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    tableView.headerView(forSection: section)?.backgroundColor = .white
    return list[section].header
  }
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return list[section].footer
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
  {
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
    
    headerView.backgroundColor = .white
    
    return headerView
  }
}
