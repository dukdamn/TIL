//: [Previous](@previous)
import Foundation

let jsonData = """
[
{
  "latitude": 30.0,
  "longitude": 40.0,
  "additionalInfo": {
    "elevation": 50.0,
  }
},
{
  "latitude": 60.0,
  "longitude": 120.0,
  "additionalInfo": {
    "elevation": 20.0
  }
}
]
""".data(using: .utf8)!


struct Coordinate {
  var latitude: Double
  var longitude: Double
  var elevation: Double

  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
    case additionalInfo
  }
  enum AdditionalInfoKeys: String, CodingKey {
    case elevation
  }
}


extension Coordinate: Decodable {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    latitude = try values.decode(Double.self, forKey: .latitude)
    longitude = try values.decode(Double.self, forKey: .longitude)

    let additionalInfo = try values.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
  }
}


extension Coordinate: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)

    var additionalInfo = container.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    try additionalInfo.encode(elevation, forKey: .elevation)
  }
}


do {
  let coordinates = try JSONDecoder().decode([Coordinate].self, from: jsonData)
  coordinates.forEach { print($0) }
} catch {
  print(error.localizedDescription)
}



/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */
//let duck1: () -> String = {"latitude": "51.1731", "longitude": "59.9933"}

func practice1() {
  let apiURL = URL(string: "http://api.open-notify.org/iss-now.json")!
  
  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
      else { return print("No Data") }
    print(jsonObject)
    
    guard (jsonObject["message"] as? String) == "success",
      let position = jsonObject["iss_position"] as? [String: String],
      let timeTamp = jsonObject["timestamp"] as? Int
      else { return print("Parsing Error") }
    print(position)
    print(timeTamp)
  }
  dataTask.resume()
}
//practice1()


/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct User {
  var id: Int
  var firstName: String
  var lastName: String
  var email: String
}

func practice2() {
  let jsonString = jsonString2
  let jsonData = jsonString.data(using: .utf8)!
  
  do {
    let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
    if let jsonDict = foundationObject as? [String: [[String:Any]]],
      let userData = jsonDict["users"]{
      print(userData)
      userData.forEach{
        print(User(id: $0["id"] as! Int, firstName: $0["first_name"] as! String, lastName: $0["last_name"] as! String, email: $0["email"] as! String))
        
      }
      
      
      //      people
      //        .compactMap {
      //          if let craft = $0["craft"], let name = $0["name"] {
      //            return Astronaut(craft: craft, name: name)
      //          }
      //          return nil
      //      }
      //      .forEach { print($0) }
    }
  } catch {
    print(error.localizedDescription)
  }
}
//practice2()



/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
var count = 0
var posts: Array<Post> = []
func practice3() {
  let apiURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  
  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]]
      else { return print("No Data") }
//    print(jsonObject)
    jsonObject.forEach{
      guard
        let userId = $0["userId"] as? Int,
        let id = $0["id"] as? Int,
        let title = $0["title"] as? String,
        let body = $0["body"] as? String else { return }
      posts.append(Post(userId: userId, id: id, title: title, body: body))
      count += 1
      print(count)
    }
  }
  dataTask.resume()
}

practice3()

//print(posts)



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)

