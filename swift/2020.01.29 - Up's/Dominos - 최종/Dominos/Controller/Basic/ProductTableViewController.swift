//
//  ProductTableViewController.swift
//  Dominos
//
//  Created by Lee on 2020/01/28.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
  
  private let products: [Product]
  
  init(menu: Menu) {
    self.products = menu.products
    super.init(nibName: nil, bundle: nil)
    
    navigationItem.title = menu.category
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.clearsSelectionOnViewWillAppear = true
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
//   cell.selectionStyle = .none
   
   return cell
   }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let name = menuData[indexPath.section].products[indexPath.row].name
    let detailVC = DetailViewController(productName: name)
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    120
  }
}
