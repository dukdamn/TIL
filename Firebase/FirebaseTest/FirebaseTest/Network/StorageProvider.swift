//
//  StorageProvider.swift
//  FirebaseTest
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseAuth
class StorageProvider {
  class func uploadImage(uid: String, data: UIImage, completion: @escaping () -> ()){
    //    guard let uid = Auth.auth().currentUser?.uid else { return }
    
    let metadata = StorageMetadata()
    metadata.contentType = "image/jpeg"
    // child
    // storage 에 가야댐
    let userImageReference = Storage.storage().reference().child(uid)
    let image = data.jpegData(compressionQuality: 0.1)!
    
    userImageReference.putData(image, metadata: metadata){ (meta, error) in
      if let error = error {
        fatalError(error.localizedDescription)
      } else {
        
        userImageReference.downloadURL { (url, error) in
          if let error = error {
            fatalError(error.localizedDescription)
          } else {
            guard let url = url?.absoluteString else { return }
            print(url)
            Firestore
              .firestore()
              .collection(Reference.user)
              .document(uid)
              .updateData([
                UserReference.profileURL: url
              ]) { (error) in
                if let error = error {
                  fatalError(error.localizedDescription)
                } else {
                  completion()
                }
            }
          }
        }
        
        //        meta?.storageReference?.downloadURL(completion: { (url, error) in
        //          if let error = error {
        //            fatalError(error.localizedDescription)
        //          } else {
        //            guard let url = url?.absoluteURL else {
        //              return
        //            }
        //            Firestore
        //              .firestore()
        //              .collection(Reference.user)
        //              .document(uid)
        //              .setData([UserReference.profileURL: url])
        //            completion()
        //          }
        //        })
      }
    }
  }
  
  class func downLoadImage(url: String, completion: @escaping (UIImage) -> ()) {
    Storage
      .storage()
      .reference(forURL: url)
      .getData(maxSize: Int64.max) { (data, error) in
        if let error = error {
          fatalError(error.localizedDescription)
        } else {
          guard
            let data = data,
            let image = UIImage(data: data)
            else { return }
          
          completion(image)
        }
    }
  }
}



