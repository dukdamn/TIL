//
//  Product.swift
//  TableViewTemplate
//
//  Created by 황정덕 on 2020/02/25.
//  Copyright © 2020 Gitbot. All rights reserved.
//
import Foundation

class Product {
   let name: String
   var selected: Bool = false
   
   init(name: String) {
      self.name = name
   }
   
   static func generateData() -> [Product] {
      return [Product(name: "iMac Pro"), Product(name: "iMac 5K"), Product(name: "Macbook Pro"),
              Product(name: "Mac mini"), Product(name: "iPhone X"), Product(name: "Apple Watch"),
              Product(name: "iPad Pro")]
   }
}
