//
//  SignProvider.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation
import Firebase

class SignProvider {
  class func signUp(email: String, password: String, nickName: String, completion: @escaping (String) -> ()){
    
    Auth.auth().createUser(withEmail: email, password: password){ (data, error) in
      if let error = error {
        fatalError(error.localizedDescription)
      } else {
        guard let uid = data?.user.uid else { return }
        Firestore
          .firestore()
          .collection(Reference.user)
          .document(uid)
          .setData([
            UserReference.email: email,
            UserReference.nickName: nickName
          ]) { (error) in
            if let error = error {
              fatalError(error.localizedDescription)
            } else {
              completion(uid)
            }
        }
      }
    }
  }
}
