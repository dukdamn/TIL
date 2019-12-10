//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() // count 1
var tory: Dog? = Dog()          // count 1

giftbot?.pet = tory             // dog count 2
tory?.owner = giftbot           // person count 2

giftbot?.doSomething()
tory?.doSomething()

//giftbot = nil                   // person count 1
//tory = nil                      // dog count 1
// 메모리 누수
/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */

/*:
 ---
 ### Answer
 ---
 */
// 순서 주의
giftbot = nil
tory = nil

giftbot?.pet = nil   // nil.pet = nil 이거와 같음 없는곳에 그냥 nil 넣음
tory?.owner = nil






//: [Next](@next)
