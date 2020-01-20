//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {
  private var CreateButton = UIButton()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    autoLayout()
  }
  private func setupUI(){
    CreateButton.setTitle("Creat New Workspace", for: .normal)
    CreateButton.titleLabel?.font = .systemFont(ofSize: 24)
    CreateButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
    CreateButton.backgroundColor = .white
    CreateButton.addTarget(self, action: #selector(newNameWSview), for: .touchUpInside)
    view.addSubview(CreateButton)
    
  }
  private func autoLayout(){
    let guide = self.view.safeAreaLayoutGuide
    CreateButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      CreateButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      CreateButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
    ])
  }
  @objc func newNameWSview(){
    let nameWSVC = UINavigationController(rootViewController: NameWSViewController())
    nameWSVC.modalPresentationStyle = .overFullScreen
    present(nameWSVC,animated: true)
  }
}
