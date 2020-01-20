//
//  UserModel.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation

struct UserModel {
  let email: String
  let nickName: String
  let profileURL: String
}

struct UserReference {
  static let email = "email"
  static let nickName = "nickName"
  static let profileURL = "profileURL"
}
