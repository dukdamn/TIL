//
//  ViewController.swift
//  LoginTest
//
//  Created by 황정덕 on 2019/12/13.
//  Copyright © 2019 Gitbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    weak private var delegate: UITextFieldDelegate?
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let superView = UIView()
    
    private let signButton = UIButton()
    
    
    private let fastCampusImage = UIImageView()
    
    
    private let bottomView = UIView()
    
    private let emailView = UIView()
    private let emailImage = UIImageView()
    private let emailTextField = UITextField()
    private let emailVar = UIView()
    
    private let pwView = UIView()
    private let pwImage = UIImageView()
    private let pwTextField = UITextField()
    private let pwVar = UIView()
    
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        baseUI()
        pwTextField.delegate = self
    }
    
    func baseUI(){
//        firstView.backgroundColor = .darkGray
//        view.addSubview(firstView)
//        secondView.backgroundColor = .green
//        view.addSubview(secondView)
        
        
        
        fastCampusImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fastCampusImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fastCampusImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            fastCampusImage.heightAnchor.constraint(equalToConstant: 100),
            fastCampusImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        
        
        
        
        superView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            superView.topAnchor.constraint(equalTo: fastCampusImage.bottomAnchor, constant: 10),
            superView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            superView.heightAnchor.constraint(equalToConstant: 40),
            superView.widthAnchor.constraint(equalToConstant: 120)
            
        ])
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstView.trailingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: -10),
            firstView.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            firstView.heightAnchor.constraint(equalToConstant: 30),
            firstView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondView.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            secondView.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 30),
            secondView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 10),
            thirdView.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            thirdView.heightAnchor.constraint(equalToConstant: 30),
            thirdView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        
        
        
        
        
        
        
        
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            signButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            signButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: signButton.topAnchor, constant: -50),
            bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        pwView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 0),
            pwView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            pwView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0),
            pwView.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 3)
        ])
        
        pwImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwImage.centerYAnchor.constraint(equalTo: pwView.centerYAnchor),
            pwImage.leadingAnchor.constraint(equalTo: pwView.leadingAnchor, constant: 10),
            pwImage.widthAnchor.constraint(equalToConstant: 25),
            pwImage.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwTextField.leadingAnchor.constraint(equalTo: pwImage.trailingAnchor, constant: 15),
            pwTextField.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: -10),
            pwTextField.centerYAnchor.constraint(equalTo: pwView.centerYAnchor),
            pwTextField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        pwVar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwVar.leadingAnchor.constraint(equalTo: pwImage.trailingAnchor, constant: 15),
            pwVar.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: -10),
            pwVar.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 5),
            pwVar.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        emailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailView.bottomAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -3),
            emailView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            emailView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0),
            emailView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0)
        ])
        
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailImage.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailImage.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailImage.widthAnchor.constraint(equalToConstant: 25),
            emailImage.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 15),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            emailTextField.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        emailVar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailVar.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 15),
            emailVar.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            emailVar.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailVar.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        
        
//        pwView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            pwView.bottomAnchor.constraint(equalTo: signButton.topAnchor, constant: -30),
//            pwView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            pwView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            pwView.heightAnchor.constraint(equalToConstant: 50)
//        ])
        
        
        
        
    }
    @objc private func didTapSignButton(){
        
    }
    private func attribute() {
        signButton.setTitle("Sign In", for: .normal)
        signButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        signButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        signButton.backgroundColor = .darkGray
        signButton.layer.cornerRadius = 10
        signButton.addTarget(self, action: #selector(didTapSignButton), for: .touchUpInside)
        
        fastCampusImage.image = UIImage(named: "fastcampus_logo")
        superView.backgroundColor = .green
        firstView.backgroundColor = .red
        firstView.layer.cornerRadius = 10
        
        secondView.backgroundColor = .red
        secondView.layer.cornerRadius = 10
        
        thirdView.backgroundColor = .red
        thirdView.layer.cornerRadius = 10
        
        superView.backgroundColor = .white
        
        
//        pwView.backgroundColor = .green
        
//        emailView.backgroundColor = .gray
//        bottomView.backgroundColor = .red
        
        
        
        emailImage.image = UIImage(named: "email")
        emailTextField.placeholder = "이메일을 입력하세요"
//
//
        pwImage.image = UIImage(named: "password")
        pwTextField.placeholder = "비밀번호를 입력하세요"
        
        pwVar.backgroundColor = .gray
        emailVar.backgroundColor = .gray
        
        
        view.addSubview(superView)
        superView.addSubview(firstView)
        superView.addSubview(secondView)
        superView.addSubview(thirdView)
    
        
        view.addSubview(signButton)
        view.addSubview(fastCampusImage)
        
        
        
        
        bottomView.addSubview(pwView)
        pwView.addSubview(pwImage)
        pwView.addSubview(pwTextField)
        pwView.addSubview(pwVar)
        
        bottomView.addSubview(emailView)
        emailView.addSubview(emailImage)
        emailView.addSubview(emailTextField)
        emailView.addSubview(emailVar)
        
        view.addSubview(bottomView)
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func  textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        UIView.animate(withDuration: 3){
             
        }
        return true
    }
}
