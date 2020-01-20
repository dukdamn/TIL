//
//  ComposeViewController.swift
//  MemoApp
//
//  Created by 황정덕 on 2020/01/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
  
  @IBOutlet weak var memoTextView: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("\n----------[새로운메모]----------\n")
    // Do any additional setup after loading the view.
  }
  
  @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func save(_ sender: Any) {
    guard let memo = memoTextView.text, memo.count > 0 else {
      alert(maggage: "메모를 입력하세요")
      return
    }
    let newMemo = Memo(content: memo)
    Memo.dummyMemoList.append(newMemo)
    dismiss(animated: true, completion: nil)
  }

  
}
