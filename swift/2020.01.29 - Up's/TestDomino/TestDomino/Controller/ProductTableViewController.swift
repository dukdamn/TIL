//
//  ProductTableViewController.swift
//  TestDomino
//
//  Created by 황정덕 on 2020/01/29.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
  private let products: [Product]
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  init(menu: Menu) {
    self.products = menu.products
    super.init(nibName: nil, bundle: nil)
    navigationItem.title = menu.category
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return products.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    let product = products[indexPath.row]
    cell.imageView?.image = UIImage(named: product.name)
    cell.textLabel?.text = product.name
    cell.detailTextLabel?.text = String(product.price) + " 원"
    cell.selectionStyle = .none
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 깔끔하게 값전달 수정
    let detailVC = DetailViewController(productName: products[indexPath.row].name)
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
