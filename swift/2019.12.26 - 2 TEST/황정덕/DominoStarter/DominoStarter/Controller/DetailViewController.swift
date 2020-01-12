//
//  DetailViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  let imageView = UIImageView()
  let stackView = UIStackView()
  let addButton = UIButton(type: .system)
  let subButton = UIButton(type: .system)
  let displayLabel = UILabel()
  var menu: MenuDetail?
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    self.view.backgroundColor = .white
    
    self.navigationItem.title = menu?.name ?? ""
    
    imageView.image = UIImage(named: menu?.name ?? "")
    imageView.contentMode = .scaleAspectFit
    self.view.addSubview(imageView)

    stackView.axis = .horizontal
    stackView.spacing = 0
    stackView.alignment = .fill
    stackView.distribution = .fill
    for view in [subButton, displayLabel, addButton] {
        stackView.addArrangedSubview(view)
    }
    self.view.addSubview(stackView)
    
    displayLabel.text = "\(menu?.ordered ?? -1) 개"
    displayLabel.textAlignment = .center
    displayLabel.backgroundColor = .gray
    displayLabel.textColor = .white
    
    addButton.setTitle("+", for: .normal)
    addButton.titleLabel?.font = .systemFont(ofSize: 24)
    addButton.layer.borderWidth = 3
    addButton.layer.borderColor = UIColor.gray.cgColor
    addButton.setTitleColor(.black, for: .normal)
    addButton.addTarget(self, action: #selector(countTouched(_:)), for: .touchUpInside)
    
    subButton.setTitle("-", for: .normal)
    subButton.titleLabel?.font = .systemFont(ofSize: 24)
    subButton.layer.borderWidth = 3
    subButton.layer.borderColor = UIColor.gray.cgColor
    subButton.setTitleColor(.black, for: .normal)
    subButton.addTarget(self, action: #selector(countTouched(_:)), for: .touchUpInside)
    
    setupConstraint()
  }
  
  private func setupConstraint() {
      let guide = self.view.safeAreaLayoutGuide
      imageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
          imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
          imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
          imageView.heightAnchor.constraint(equalTo: guide.widthAnchor, constant: 1),
      ])
      
      stackView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
          stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40),
          stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40),
          stackView.heightAnchor.constraint(equalToConstant: 40),
      ])
      
      addButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          addButton.widthAnchor.constraint(equalToConstant: 44),
      ])
      
      subButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          subButton.widthAnchor.constraint(equalTo: addButton.widthAnchor),
      ])
  }
  var count = 0 {
      didSet {
          guard let menu = menu else { return }
          menu.ordered = count
          if count > 0 {
              UserData.main.update(menu: menu)
          } else {
              UserData.main.remove(menu: menu)
          }
          self.displayLabel.text = "\(count) 개"
      }
  }
  
  @objc private func countTouched(_ sender: UIButton) {
      if sender.currentTitle == "+" {
          count += 1
      } else {
          count = (count == 0) ? count : (count - 1)
      }
  }
}
