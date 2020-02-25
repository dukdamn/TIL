//
//  Landscape.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class Landscape {
   let urlString: String
   var url: URL {
      guard let url = URL(string: urlString) else {
         fatalError("invalid URL")
      }
      return url
   }
   var image: UIImage?
   
   init(urlString: String) {
      self.urlString = urlString
   }
   
   static func generateData() -> [Landscape] {
      return (1...36).map { Landscape(urlString: "http://kxcodingblob.blob.core.windows.net/mastering-ios/\($0).jpg") }
   }
}












