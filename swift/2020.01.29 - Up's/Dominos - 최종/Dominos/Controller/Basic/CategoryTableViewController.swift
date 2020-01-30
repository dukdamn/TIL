//
//  CategoryTableViewController.swift
//  Dominos
//
//  Created by Lee on 2020/01/28.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setNavigation()
    setUI()
  }
  
  private func setNavigation() {
    navigationItem.title = "Domino's"
  }
  
  private func setUI() {
    let imageView = UIImageView()
    imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 200))
    imageView.image = UIImage(named: "logo")
    imageView.contentMode = .scaleAspectFit
    tableView.tableHeaderView = imageView
    
    tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuData.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else { fatalError() }
    
    cell.configure(category: menuData[indexPath.row].category)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productVC = ProductTableViewController(menu: menuData[indexPath.row])
    navigationController?.pushViewController(productVC, animated: true)
  }
}
