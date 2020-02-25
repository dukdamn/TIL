//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Giftbot on 2020/02/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    requestGet()
  }
  private func requestGet() {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://apis.openapi.sk.com/weather/forecast/3days?version=1&lat=37.498206&lon=127.02761&appKey=l7xx6f159c1ff99047da8444636f04b63d82"
    guard let url = URL(string: todoEndpoint) else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      guard error == nil else {return print(error!.localizedDescription)}
      guard let response = response as? HTTPURLResponse,
        (200..<300).contains(response.statusCode),
        response.mimeType == "application/json" else { return }
      guard let data = data else { return print("No Data") }
      guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("Could not get parsed data")}
      print(todo)
    }
    task.resume()
    
  }

}

