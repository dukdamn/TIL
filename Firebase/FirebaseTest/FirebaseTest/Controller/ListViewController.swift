//
//  ListViewController.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  private let tableView = UITableView()
  private var userData = [UserModel]()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UserProvider.downLoad { (tempData) in
      print("\n----------[check]----------\n")
      self.userData = tempData
      self.tableView.reloadData()
    }
  }

  
}


extension ListViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    userData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = userData[indexPath.row].email
    StorageProvider.downLoadImage(url: userData[indexPath.row].profileURL, completion: {  (tempImage) in
      cell.imageView?.image = tempImage
      tableView.reloadData()
    } )
    return cell
  }
}
