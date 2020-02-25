//
//  ViewController.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

struct MyData {
  let data1 = "나는 멋쟁이!"
  let data2 = "나는 멋쟁이!"
  let data3 = "나는 멋쟁이!"
  let data4 = "나는 멋쟁이!"
  let data5 = "나는 멋쟁이!"
  let data6 = "나는 멋쟁이!"
  let data7 = "나는 멋쟁이!"
  let data8 = "나는 멋쟁이!"
  let data9 = "나는 멋쟁이!"
  let data10 = "나는 멋쟁이!"
  let data11 = "나는 멋쟁이!"
}
final class ViewController: UIViewController {
  private let dog = Dog()
  private let cat = Cat()

  override var description: String {
    return "VeiwController"
  }
  override var debugDescription: String {
    return "ViewController Debugging!"
  }
  @IBAction private func didTapPrint(_ sender: Any) {
    print("\n---------- [ print ] ----------\n")
    print("Hello, world!")
    print(1...10)
    print(dog)
    print(cat)
    print(self)
  }
  
  @IBAction private func didTapDebugPrint(_ sender: Any) {
    print("\n---------- [ debugPrint ] ----------\n")
    debugPrint("Hello, world!")
    debugPrint(1...10)
    debugPrint(dog)
    debugPrint(cat)
    debugPrint(self)
  }
  
  @IBAction private func didTapDump(_ sender: Any) {
    print("\n---------- [ dump ] ----------\n")
    dump("Hello, world!")
    dump(1...10)
    dump(dog)
    dump(cat)
    dump(self)
  }
  
  @IBAction private func didTapNSLog(_ sender: Any) {
    print("\n---------- [ NSLog ] ----------\n")
    NSLog("Hello, world!")
    NSLog("%@", self)
    NSLog("%d", 1)
    
    NSLog("%@", "Self")
    NSLog("%@", dog)
    // 구조체는 nsobject 상속불가
//    NSLog("%@", cat.)
  }
  
  @IBAction private func didTapSpecialLiterals(_ sender: Any) {
    print("\n---------- [ didTapSpecialLiterals ] ----------\n")
    /*
     #file : (String) 파일 이름
     #function : (String) 함수 이름
     #line : (Int) 라인 넘버
     #column : (Int) 컬럼 넘버
     */
    print("#file : ", #file)
    print("#function : ", #function)
    print("#line : ", #line)
    print("#column : ", #column)
    
    print("\n----------[ Exameple]----------\n")
    print("< \(#function) [\(#line)]")
  }
  
  @IBAction private func didTapCustomLog(_ sender: Any) {
    print("\n---------- [ Custom Log ] ----------\n")

    
  }
  
  @IBAction private func didTapTestButton(_ sender: Any) {
    print("\n---------- [ Test ] ----------\n")
    // 테스트용 버튼
  }
}



