//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    let url = URL(string: imageUrlStr)!
    
    // sync 메소드
    //    if let data = try? Data(contentsOf: url) {
    //      imageView.image = UIImage(data: data)
    //    }
    
    // async 메소드
    DispatchQueue.global().async {
      if let data1 = try? Data(contentsOf: url) {
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data1)
        }
      }
    }
    
    //    URLSession.shared.dataTask(with: url) { (data, r, e) in
    //      if let data = data {
    //
    //      }
    //    }
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /*
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
     */
    // 위 URL 구성을 보고 URLComponents의 각 파트를 수정해 위 구성과 같도록 만들어보기
    
    var components = URLComponents()
    components.scheme = "http"
    print(components)
    components.user = "username"
    print(components)
    components.password = "password"
    print(components)
    components.host = "www.example.com"
    print(components)
    components.port = 80
    print(components)
    components.path = "/index.html"    // path는 /로 시작해야 함
    print(components)
    components.query = "key1=value1&key2=value2"
    print(components)
    components.fragment = "myFragment"
    print(components)
    
    
    var comp = URLComponents(string:"http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment")
    
  }
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    //영어주소
    let urlStromgE = "https://search.naver.com/search.naver?query=swift"
    print(URL(string: urlStromgE) ?? "Nil")
    
    // utf8
    //한글주소 - 퍼센트 인코딩
    let urlStromgK = "https://search.naver.com/search.naver?query=한글"
    print(URL(string: urlStromgK) ?? "Nil")
    
    let str = "https://search.naver.com/search.naver?query=한글"
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let convertedURL = URL(string: queryEncodedStr)!
    print(convertedURL)
    
    // URL -> String
    let endodedUtlString = "https://example.com/#color-%23708090"
    // % 인코딩 제거
    print(endodedUtlString.removingPercentEncoding ?? "Nil")
    
    // String -> URL
    let originalString = "color-#708090"
    
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    
    let encodedString1 = originalString.addingPercentEncoding(withAllowedCharacters: allowed)!
    print(encodedString1)
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral // 데이터로 남기지 않음
    _ = URLSessionConfiguration.background(withIdentifier: "kr.gifbot.example.backgroundConfig") // 백그라운드에서 사용
    
    let sessionConfig = URLSessionConfiguration.default
    // 기본값은 true. Wi-Fi만 가능하도록 설정
    sessionConfig.allowsCellularAccess = false
    // 기본값은 4. 호스트당 최대 몇개까지 사용 가능하게 하는지
    sessionConfig.httpMaximumConnectionsPerHost = 5
    // 기본값은 60.
    sessionConfig.timeoutIntervalForRequest = 20
    // 내가 원하는 캐쉬정책을 지정함. 기본값은 .useProtocolcachePolicy
    sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData  // 로컬캐쉬데이타를 무시하고 원본에 접근
    // 기본값은 false. 연결해보고 실패했을때 기다렸다가 연결다시 시도
    sessionConfig.waitsForConnectivity = true
    
    // 기본 캐쉬 URLCache.shared
    // 메모리 - 16 KB (16 * 1024 = 16_384)
    // 디스크 - 256 MB (256 * 1024 * 1024 = 268_435_456)
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    
    
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    print(myCache.memoryCapacity)   // 500KB
    print(cache.currentDiskUsage)   // 약 9.5MB
    print(cache.diskCapacity)       //
    // 현제 사용량
    print(cache.currentDiskUsage)   //
    
    // 저장 경로
    // (user home directory)/Library/Caches/(application bundle id)/
    cache.removeAllCachedResponses()
    
    let mySession = URLSession(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    let task = mySession.dataTask(with: url) {
      [weak self] (data, response, error) in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self?.imageView.image = UIImage(data: data)!
        print("download completed")
      }
    }
    task.resume()
  }
  
  
  // MARK: - Get, Post, Delete
  
  // https://jsonplaceholder.typicode.com/
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
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
      guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let todoID = todo["id"] as? Int,
        let todoTitle = todo["title"] as? String
        else { return print("Could not get parsed data")}
      print("ID :", todoID)
      print("Title :", todoTitle)
    }
    task.resume()
    
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let todoURL = URL(string: todoEndpoint) else { return }
    
    let newToDO: [String: Any] = ["title": "My ToDo", "userID": "20"]
    guard let jsonTodo = try? JSONSerialization.data(withJSONObject: newToDO) else { return }
    
    var urlRequest = URLRequest(url: todoURL)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = jsonTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) {
      (data, response, error) in
      guard let data = data, let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      print(newItem)
      if let id = newItem["id"] as? Int {
        print(id)
      }
    }
    task.resume()
  }
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    
    let task = URLSession.shared.dataTask(with: urlRequest) {
      (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      guard let data = data else { return print("No Data") }
      print("DELETE ok")
      
      if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
        print(data)  // 2 bates
        print(jsonObject)  // [:]
      }
    }
    task.resume()
  }
}

