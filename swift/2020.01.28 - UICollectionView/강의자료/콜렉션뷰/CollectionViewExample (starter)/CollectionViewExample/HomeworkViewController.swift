//
//  HomeworkViewController.swift
//  CollectionViewExample
//
//  Created by 황정덕 on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController {
  
  fileprivate var data = ["One", "Two", "Three", "Four", "Five"]
  fileprivate var snapshot: UIView?
  fileprivate var sourceIndexPath: IndexPath?
  private var tableView = UITableView()
//  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    attribute()
    setupUI()
  }
  private func attribute() {
    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized(longPress:)))
    self.tableView.addGestureRecognizer(longPress)
    tableView.backgroundColor = .white
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    tableView.dataSource = self
  }
  private func setupUI(){
    [tableView].forEach {
      self.view.addSubview($0)
    }
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func longPressGestureRecognized(longPress: UILongPressGestureRecognizer) {
    let state = longPress.state
    let location = longPress.location(in: self.tableView)
    guard let indexPath = self.tableView.indexPathForRow(at: location) else {
      self.cleanup()
      return
    }
    switch state {
    case .began:
      sourceIndexPath = indexPath
      guard let cell = self.tableView.cellForRow(at: indexPath) else { return }
      snapshot = self.customSnapshotFromView(inputView: cell)
      guard  let snapshot = self.snapshot else { return }
      var center = cell.center
      snapshot.center = center
      snapshot.alpha = 0.0
      self.tableView.addSubview(snapshot)
      UIView.animate(withDuration: 0.25, animations: {
        center.y = location.y
        snapshot.center = center
        snapshot.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        snapshot.alpha = 0.98
        cell.alpha = 0.0
      }, completion: { (finished) in
        cell.isHidden = true
      })
      break
    case .changed:
      guard  let snapshot = self.snapshot else {
        return
      }
      var center = snapshot.center
      center.y = location.y
      snapshot.center = center
      guard let sourceIndexPath = self.sourceIndexPath  else {
        return
      }
      if indexPath != sourceIndexPath {
        data.swapAt(indexPath.row, sourceIndexPath.row)
//        swap(&data[indexPath.row], &data[sourceIndexPath.row])
        self.tableView.moveRow(at: sourceIndexPath, to: indexPath)
        self.sourceIndexPath = indexPath
      }
      break
    default:
      guard let cell = self.tableView.cellForRow(at: indexPath) else {
        return
      }
      guard  let snapshot = self.snapshot else {
        return
      }
      cell.isHidden = false
      cell.alpha = 0.0
      UIView.animate(withDuration: 0.25, animations: {
        snapshot.center = cell.center
        snapshot.transform = CGAffineTransform.identity
        snapshot.alpha = 0
        cell.alpha = 1
      }, completion: { (finished) in
        self.cleanup()
      })
    }
  }
  
  private func cleanup() {
    self.sourceIndexPath = nil
    snapshot?.removeFromSuperview()
    self.snapshot = nil
    self.tableView.reloadData()
  }
  
  
  private func customSnapshotFromView(inputView: UIView) -> UIView? {
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0)
    if let CurrentContext = UIGraphicsGetCurrentContext() {
      inputView.layer.render(in: CurrentContext)
    }
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      UIGraphicsEndImageContext()
      return nil
    }
    UIGraphicsEndImageContext()
    let snapshot = UIImageView(image: image)
    snapshot.layer.masksToBounds = false
    snapshot.layer.cornerRadius = 0
    snapshot.layer.shadowOffset = CGSize(width: -5, height: 0)
    snapshot.layer.shadowRadius = 5
    snapshot.layer.shadowOpacity = 0.4
    return snapshot
  }
}

extension HomeworkViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = data[indexPath.row]
    return cell
  }
}
