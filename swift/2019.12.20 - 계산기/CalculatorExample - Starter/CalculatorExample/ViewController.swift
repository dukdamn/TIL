//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet var numbersButton: [UIButton]!
  @IBOutlet var caculateButton: [UIButton]!
  
  @IBOutlet weak var clearButton: UIButton!
  
  
  @IBOutlet weak var displayLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    round()
  }
  
  private func round(){
    for button in numbersButton {
      button.layer.cornerRadius = button.frame.width / 2
    }
    for button in caculateButton {
      button.layer.cornerRadius = button.frame.width / 2
    }
    clearButton.layer.cornerRadius = clearButton.frame.width / 2
  }
  
  private let displayFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 3
    
    return formatter
  }()
  
  
  
  private var firstItem = ""{
    didSet{
      
      let numString = displayFormatter.string(from: Int(firstItem)! as NSNumber)
      
      self.displayLabel.text = numString
      
      
    }
  }
  
  @IBAction func numberTouched(_ sender: UIButton) {
    
    guard firstItem.count < 13 else { return }
    
    firstItem += sender.titleLabel!.text!
  }
  
  @IBAction func resetButton(_ sender: UIButton) {
    
    firstItem = "0"
    displayLabel.text = firstItem
    
  }
  
  @IBAction func PlusButtonTouched(_ sender: UIButton) {
  }
}

