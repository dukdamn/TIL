//
//  User.swift
//  AlamofireTest
//
//  Created by 황정덕 on 2020/02/21.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation
struct CreditCard: Decodable {
  let expiration: String
  let number: String
  let pin: Int
  let security: Int
}
struct User: Decodable {
  let fullName: String
  let phone: String
  let birthDay: Date
  let email: String
  let creditCard: CreditCard
  let photo: String
  private enum CodingKeys: String, CodingKey {
    case name, surname, phone, birthday, email, photo
    case creditCard = "credit_card"
  }
  private enum BirthdayKeys: String, CodingKey {
    case dmy, mdy, raw
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let surname = try container.decode(String.self, forKey: .surname)
    let name = try container.decode(String.self, forKey: .name)
    self.fullName = surname + name
    self.phone = try container.decode(String.self, forKey: .phone)
    self.email = try container.decode(String.self, forKey: .email)
    self.creditCard = try container.decode(CreditCard.self, forKey: .creditCard)
    self.photo = try container.decode(String.self, forKey: .photo)
    let birthdayContainer = try container.nestedContainer(
      keyedBy: BirthdayKeys.self,
      forKey: .birthday
    )
    let raw = try birthdayContainer.decode(Double.self, forKey: .raw)
    self.birthDay = Date(timeIntervalSince1970: raw)
  }
}
