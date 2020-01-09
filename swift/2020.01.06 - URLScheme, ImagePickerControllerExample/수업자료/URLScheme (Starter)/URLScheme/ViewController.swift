//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url)
      else { return }
    UIApplication.shared.open(url)
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
//    let scheme = "mailto:"
//    메일 받는사람의 메일주소가 바로 설정, 여러명도 가능
//    let scheme = "mailto:someone@mail.com,someone2@mail.com,someone3@mail.com"
    let scheme = "mailto:someone@mail.com?cc=foo@bar.com&bcc=duck&subject=title&body=MyText"
    guard let url = URL(string: scheme), UIApplication.shared.canOpenURL(url) else {
      return
    }
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
//    let url = URL(string: "sms:")
//    let url = URL(string: "sms:010-9211-7742")
//    guard UIApplication.shared.canOpenURL(url) else {
//      return
//    }
//    guard UIApplication.shared.canOpenURL(url) else { return }
//    UIApplication.shared.open(url)
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let url = URL(string: "http://google.com")!
    guard UIApplication.shared.canOpenURL(url) else {
      return
    }
    UIApplication.shared.open(url)
  }
  
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
//    3rd Party 앱에 대해서 화이트리스트 등록 필요
//    최초 1회 넘어갈 때 이동을 허락하면 이후부터는 바로 넘어감
    
    let url = URL(string: "instagram://user?username=soohan_lee")!
    guard UIApplication.shared.canOpenURL(url) else {
      return
    }
    UIApplication.shared.open(url)
  }
  
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    /*
     myApp://host?name=abc&age=10
     - scheme: myApp
     - host: host
     - query: name=abc&age=10
     */
//    let url = URL(string: "myApp:")!
    let url = URL(string: "myApp://host?name=abc&age=10")!
    guard UIApplication.shared.canOpenURL(url) else {
      return
    }
    UIApplication.shared.open(url)
  }
}




