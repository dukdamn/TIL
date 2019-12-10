//: [Previous](@previous)
/*
 싱글톤 방식으로 해보기 전에
 아래에 주어진 코드를 이용해 User에 친구 추가하기
 유저를 전역변수로 쓰지말고
 */

class User {
    static let shared = User()
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends: Equatable {
    let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */


class FriendList {
    var user: User
    init(user: User) {
        self.user = user
    }
    func addFriend(name: String) {
        let friend = Friends(name: name)
        user.friends.append(friend)
        // 호출 시 해당 이름의 친구를 friends 배열에 추가
    }

    func blockFriend(name: String) {
        let friend = Friends(name: name)
        if let index = user.friends.firstIndex(of: friend){
            user.friends.remove(at: index)
        }
        if !user.blocks.contains(friend){
            user.blocks.append(friend)
        }
        // 호출 시 해당 이름의 친구를 blocks 배열에 추가
        // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    }
}
class FriendList1 {
    func addFriend(name: String) {
        user.friends.append(Friends.init(name: name))
        // 호출 시 해당 이름의 친구를 friends 배열에 추가
    }
    
    func blockFriend(name: String) {
        user.blocks.append(Friends.init(name: name))
        user.friends.remove(at: user.friends.firstIndex(of: Friends.init(name: name))!)
        // 호출 시 해당 이름의 친구를 blocks 배열에 추가
        // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    }
}


//

let user = User()

var friendList = FriendList(user: user)
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
print(user.friends)  // 원빈, 장동건
print(user.blocks)    // 정우성


//: [Next](@next)
