# Singleton

특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴

한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주

어플리케이션에서 유일하게 하나만 필요한 객체에 사용

UIApplication, AppDelegate 등

```swift
/*
 iOS 싱글톤 사용 예
 */
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default
```

## Syntax

### Swift

```swift
/*
 static 전역 변수로 선언한 것은 지연(lazy) 생성되므로
 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 */
// static var, static let
// 타입 프로퍼티
// SingletonClass\
// 쓰는 순간에 메모리에 올라감

class SingletonClass {
  static let shared = SingletonClass()
  var x = 0
}


let singleton1 = SingletonClass.shared
//let singleton1 = SingletonClass() 위에와 같음 처음 선언떄
singleton1.x = 10
// static이여서 첫번쨰 선언된 주소를 받음
let singleton2 = SingletonClass.shared
//let singleton1 = SingletonClass() 두뻔쨰라 다름
singleton2.x = 20

singleton1.x   //
singleton2.x   //


SingletonClass.shared.x = 30
SingletonClass.shared.x  //
singleton1.x  //
singleton2.x  //



SingletonClass().x = 99
SingletonClass().x   // 0 
singleton1.x  //
singleton2.x  //


/*
 싱글톤 클래스를 이용한 방법
 */


class User {
  static let shared = User()
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}


class FriendList {
  func addFriend(name: String) {
    let user = User()
    let friend = Friends(name: name)
    user.friends.append(friend)
    // "원빈", "장동건", "정우성" 3명을 친구로 추가했을 때
    // 최종적으로 user.friends 에 들어있는 friend 의 숫자는?
    
    
//    let user = User.shared
//    let friend = Friends(name: name)
//    user.friends.append(friend)
  }
  
  
  func blockFriend(name: String) {
    let friend = Friends(name: name)
    
    if let index = User.shared.friends.firstIndex(of: friend) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(friend) {
      User.shared.blocks.append(friend)
    }
  }
}


var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
User.shared.friends


friendList.blockFriend(name: "원빈")
User.shared.friends
User.shared.blocks



// User vs User.shared 비교

let userInit = User()
userInit.friends
userInit.blocks

let userShared = User.shared
userShared.friends
userShared.blocks
```



# UserDefaults

iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나

간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장

메모리에서는 프로그램이 종료되면 자료들이 없어진다.