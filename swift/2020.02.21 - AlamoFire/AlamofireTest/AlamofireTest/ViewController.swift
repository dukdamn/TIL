//
//  ViewController.swift
//  AlamofireTest
//
//  Created by 황정덕 on 2020/02/21.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private var users: [User] = [] {
    didSet { tableView.reloadData() }
  }
  private let serviceManager = ServiceManager.shared
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 60
    serviceManager.requestUser { [weak self] result in
      switch result {
      case .success(let users):
        self?.users = users
      case .failure(let error):
        print(error)
      }
      
    }
  }
  func requestCellData(_ cell: UITableViewCell, for indexPath: IndexPath){
    let user = users[indexPath.row]
    serviceManager.requestImage(user.photo) { [weak self] response in
      guard let data = try? response.get() else { return }
      
      if let cell = self?.tableView.cellForRow(at: indexPath) {
        cell.imageView?.image = UIImage(data: data)
        cell.textLabel?.text = user.fullName
        cell.detailTextLabel?.text = user.email
      }
    }
  }
  private func setupURL(){
    let urlString = "https://mbgcbp2hm5.execute-api.ap-northeast-2.amazonaws.com/api"
    let url = URL(string: urlString)!
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data,
        let jsonObject = try? JSONDecoder().decode([User].self, from: data) else { return }
      //        let jsonObject = try? JSONSerialization.jsonObject(with: data) else { return }
      print(jsonObject)
    }
    dataTask.resume()
  }
}


extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    requestCellData(cell,for: indexPath)

    return cell
  }
}
