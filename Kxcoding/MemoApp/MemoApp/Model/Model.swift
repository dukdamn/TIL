//
//  Model.swift
//  MemoApp
//
//  Created by 황정덕 on 2020/01/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation


class Memo {
  var content: String
  var insertDate: Date
  
  init(content: String) {
    self.content = content
    insertDate = Date()
  }
  
  static var dummyMemoList = [
    Memo(content: "Lorem Ipsum"),
    Memo(content: "Subscribe + 👍 = 💕")
  ]
}
