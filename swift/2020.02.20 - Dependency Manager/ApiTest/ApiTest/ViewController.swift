//
//  ViewController.swift
//  ApiTest
//
//  Created by 황정덕 on 2020/02/20.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
class MovieVO {

    var thumbnail: String? // 영화 섬네일 이미지 주소

    var title: String? // 영화 제목

    var description: String? // 영화 설명

    var detail: String? // 상세정보

    var opendate: String? // 개봉일

    var rating: Double? // 평점

    

    // 영호 썸네일 이미지를 담을 UIImage 객체를 추가한다.

    var thumbnailImage: UIImage?

}

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 1. 호핀 API 호출을 위한 URI를 생성
    let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
    //"https://jsonplaceholder.typicode.com/posts"
    //    "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
    let apiURI: URL! = URL(string: url)
    // 2. REST API 호출
    
    guard let apidata = try? Data(contentsOf: apiURI) else {
      return print("전달받지 못함")
    }
    
    // 3. 데이터 전송 결과를 로그로 출력 (반드시 필요한 코드는 아님)
    //    let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
    //    NSLog("API Result=\(log)")
    
    //    let dataTask = URLSession.shared.dataTask(with: apiURI) { (data, response, error) in
    //      guard let data = data,
    //        let jsonObject = try? JSONSerialization.jsonObject(with: data)
    //        else { return print("No Data") }
    //      print(jsonObject)
    //
    //    }
    //    dataTask.resume()
    // 4.JSon 객체를 파싱하여 NSDictionary 객체로 받음
    
    do {
      
      let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
      
      
      
      // 5) 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
      
      let hoppin = apiDictionary["hoppin"] as! NSDictionary
      
      let movies = hoppin["movies"] as! NSDictionary
      
      let movie = movies["movie"] as! NSArray
      
      
      
      // 6) Iterator 처리를 하면서 API 데이터 MovieVO 객체에 저장한다.
      
      for row in movie {
        
        // 순회 상수를 NSDictionary 타입으로 캐스팅
        
        let r = row as! NSDictionary
        
        
        
        // 테이블 뷰 리스트를 구성할 데이터 형식
        
        let mvo = MovieVO()
        
        
        
        // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
        
        mvo.title = r["title"] as? String
        
        mvo.description = r["genreNames"] as? String
        
        mvo.thumbnail = r["thumbnailImage"] as? String
        
        mvo.detail = r["linkUrl"] as? String
        
        mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
        
        
        
        // 웹상에 있는 이미지를 읽어와 UIImage 객체로 설정
        
        let url: URL! = URL(string: mvo.thumbnail!)
        
        let imageData = try! Data(contentsOf: url)
        
        mvo.thumbnailImage = UIImage(data:imageData)
        
        
        
        
        
        // list 배열에 추가
        
//        self.list.append(mvo)
        
        
        
        // 7) 전체 데이터 카우트를 얻는다.
        
        let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
        
        
        
        // 8) totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다.
        
//        if (self.list.count >= totalCount){
//
//          self.moreBtn.isHidden = true
//
//        }
        
      }
      
    }catch { NSLog("Parse Error!!")}
  }
  
  
}

