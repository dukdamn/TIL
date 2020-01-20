//
//  UserProvider.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation
import Firebase

class UserProvider {
  class func downLoad(completion: @escaping ([UserModel])->()){
    Firestore
      .firestore()
      .collection(Reference.user).getDocuments { (snapshot, error) in
        if let error = error {
          fatalError(error.localizedDescription)
          
        } else {
          guard let documents = snapshot?.documents else { return }
          var userData = [UserModel]()
          for doucument in documents {
            let data = doucument.data()
            dump(data)
            guard
              let email = data[UserReference.email] as? String,
              let nickname = data[UserReference.nickName] as? String,
              let url = data[UserReference.profileURL] as? String
              else { return }
            let tempUser = UserModel(email: email, nickName: nickname, profileURL: url)
            
            userData.append(tempUser)
          }
          completion(userData)
        }
    }
    
  }
}
