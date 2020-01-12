//
//  ListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    self.view.backgroundColor = .white
    self.navigationItem.title = "Domino's"
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 120
    
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
}

extension ListViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    menuData.count
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let pizaImage = UIImageView()
    pizaImage.image = UIImage(named: menuData[section].category)
    return pizaImage
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    menuData[section].products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") {
      cell = menuCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MenuCell")
    }
    cell.imageView?.image = UIImage(named: menuData[indexPath.section].products[indexPath.row].name)
    cell.textLabel?.text = menuData[indexPath.section].products[indexPath.row].name
    cell.detailTextLabel?.text = "\(menuData[indexPath.section].products[indexPath.row].price)원"
    return cell
  }
  
  
  
  //
  
}


extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let menuListVC = DetailViewController()
    menuListVC.menu = MenuDetail(name: menuData[indexPath.section].products[indexPath.row].name, price: menuData[indexPath.section].products[indexPath.row].price)
    self.navigationController?.pushViewController(menuListVC, animated: true)
  }
}
