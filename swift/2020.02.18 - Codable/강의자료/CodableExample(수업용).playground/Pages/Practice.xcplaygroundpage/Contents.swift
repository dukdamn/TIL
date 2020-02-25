//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Codable {
  var name: String
  var cost: Int
  var description: String?
  
  private enum CodingKeys: String, CodingKey {
    case name = "name"
    case cost = "cost"
    case description = "description"
  }
}
if let fruits = try? decoder.decode([Fruit].self, from: jsonFruits){
  fruits.forEach{
    print($0)
  }
}

/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Codable {
  var name: String
  var reportId: Int
  var readCount: Int
  var reportDate: Date
  
  private enum CodingKeys: String, CodingKey {
    case name = "name"
    case reportId = "report_id"
    case readCount = "read_count"
    case reportDate = "report_date"
  }
}

extension Report {
  //  init?(from json: [String: Any]) {
  //    guard let name = json["name"] as? String,
  //      let report_id = json["report_id"] as? Int,
  //      let read_count = json["read_count"] as? Int,
  //      let report_date = json["report_date"] as? Date
  //      else { return nil }
  //    self.name = name
  //    self.report_id = report_id
  //    self.read_count = read_count
  //    self.report_date = report_date
  //  }
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String.self, forKey: .name)
    let id = try values.decode(String.self, forKey: .reportId)
    let count = try values.decode(String.self, forKey: .readCount)
    let date = try values.decode(String.self, forKey: .reportDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.locale = Locale(identifier: "ko")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    self.reportId = Int(id)!
    self.readCount = Int(count)!
    self.reportDate = dateFormatter.date(from:date)!
  }
}
print("check")
if let report = try? decoder.decode(Report.self, from: jsonReport){
  print(report)
}
print("check")
/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!

struct Person : Codable {
  let name: String
  let favorite_movies: [Movie]
  struct Movie : Codable{
    let title: String
    let release_year: Int
  }
}

do {
  let astronauts = try JSONDecoder().decode([Person].self, from: jsonMovie)
  astronauts.forEach{
    print($0.name)
    $0.favorite_movies.forEach{
      print($0)
    }
  }
} catch {
  print(error.localizedDescription)
}


/*
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 */
print("\n---------- [ 4번 문제 (Repositories) ] ----------\n")

struct Repositories : Codable{
  let items: [Repository]
  enum CodingKeys: String, CodingKey {
    case items = "items"
  }
  struct Repository : Codable {
    let fullName: String
    let description: String?
    let starCount: Int
    let forkCount: Int
    let url: String
    enum CodingKeys: String, CodingKey {
      case fullName = "full_name"
      case description = "description"
      case url = "html_url"
      case forkCount = "forks_count"
      case starCount = "stargazers_count"
    }
  }
}
//[String:Any]
//[String:[[String:Any]]]
//[String:[[String:[String:Any]]]]
func fetchGitHubRepositories() {
  let urlString = "https://api.github.com/search/repositories?q=user:giftbott"
  let url = URL(string: urlString)!
  let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let data = data,
      let jsonObject = try? JSONDecoder().decode(Repositories.self, from: data) else { return }
    jsonObject.items.forEach{
      print($0)
    }
  }
  dataTask.resume()
}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
