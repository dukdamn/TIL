//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox
final class NameWSViewController: UIViewController {
  private var nameTextField = UITextField()
  private var workspaceLabel = UILabel()
  
  let leftButton: UIBarButtonItem = {
    let button = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(buttonPressed(_:)))
    button.tag = 1
    return button
  }()
  let rightButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: #selector(buttonPressed(_:)))
    button.tag = 2
    return button
  }()
  
  override func viewDidLoad() {
    nameTextField.delegate = self
    view.backgroundColor = .white
    setupUI()
    autoLayout()
    
    navigationController?.navigationBar.shadowImage = UIImage()
//    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.isTranslucent = false
    navigationItem.rightBarButtonItem = rightButton
    navigationItem.leftBarButtonItem = leftButton
    navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.nameTextField.becomeFirstResponder()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  private func setupUI(){
    
    
    
    workspaceLabel.text = "Name your workspace"
    workspaceLabel.font = .systemFont(ofSize: 17)
    nameTextField.borderStyle = .none
    nameTextField.placeholder = "Name your workspace"
    view.addSubview(nameTextField)
  }
  private func autoLayout(){
    let guide = self.view.safeAreaLayoutGuide
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      
      nameTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
      nameTextField.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -40)
    ])
  }
  
  @objc private func buttonPressed(_ sender: Any){
    if let button = sender as? UIBarButtonItem {
      switch button.tag {
      case 1:
        dismiss(animated: true)
      case 2:
        // Change the background color to red.
          self.view.backgroundColor = .red
      default: print("error")
      }
    }
  }
}

extension NameWSViewController: UITextFieldDelegate{
  func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacemenString string: String) -> Bool {
      print(string)
      
      return string == "a" ? false : true
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
  }
  
  // 화면 터치시 키보드 사라지기
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.nameTextField.resignFirstResponder()
  }
  
  // return키를 누름과 동시에 키ㅗㅂ드가 사라지는 기능
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.nameTextField.resignFirstResponder()
    AudioServicesPlaySystemSound(1015)
    return true
  }
}
