//
//  SignUpViewController.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  let emailTextField = UITextField()
  let passwordTextField = UITextField()
  let nickNameTextField = UITextField()
  let signUpButton = UIButton()
  
  let space: CGFloat = 80
  override func viewDidLoad() {
    super.viewDidLoad()
    emailTextField.placeholder = "Email"
    passwordTextField.placeholder = "Password"
    nickNameTextField.placeholder = "NickName"
    signUpButton.setTitle("SignUp", for: .normal)
    signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    let views = [emailTextField, passwordTextField, nickNameTextField, signUpButton]
    
    views.enumerated().forEach{ (index, textField) in
      view.addSubview(textField)
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
      textField.topAnchor.constraint(equalTo: view.topAnchor, constant: space * CGFloat(index + 1)).isActive = true
      
      textField.backgroundColor = .gray
    }
  }
  
  @objc private func signUpButtonAction(){
    guard
      let email = emailTextField.text,
      let password = passwordTextField.text,
      let nickName = nickNameTextField.text
      else { return }
    
    // imagepicer 로 넘겨 줘야댐
    view.backgroundColor = .red
    SignProvider
      .signUp(email: email, password: password, nickName: nickName) { (uid) in
        // uid 고유한 이름으로 저장되기 위해??
        StorageProvider.uploadImage(uid: uid, data: UIImage(named: "splash")!){
          self.view.backgroundColor = .white
        }
    }
  }

}
