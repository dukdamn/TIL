import UIKit


/***************************************************
 Q. 캡슐화 적용해보기
 - A가 서울에서 부산까지 여행을 가기로 함
 - A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
 - 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
 - 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 외부에서는 자세한 내용은 알거나 수정하지 못함
 ***************************************************/


class A {
    private var location = ""
    func currentLocation() -> String{
        self.location
    }
    func goToBusan() {
        self.location = "부산"
        eat()
        
        hangOut()
        sleep()
    }
    private func eat(){
        print("낙곱새먹음")
    }
    private func sleep(){
        print("해운대에서잠")
    }
    private func hangOut(){
        print("수변공원감")
    }
}

let a = A()
a.currentLocation()
a.goToBusan()
a.currentLocation()



let viewController = UIViewController()
viewController.loadView()
//뷰가 로드히거 <-> 로드가 완료된 시점
viewController.viewDidLoad()


//Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현
//
//상속을 하지 않고 각각 개별적으로 만들면 어떻게 구현해야 하는지 확인
//상속을 적용하면 어떻게 바뀌는지 확인

class Person {
    let name = "홍길동"
    let age = 20
}
class Student: Person  {
    let grade = "A"
}

class UniversityStudent: Student {
    let major = "Computer Science"
}



// bark() 메서드를 가진 Dog 클래스를 상속받아 Poodle, Husky, Bulldog 이 서로 다르게 짖도록 구현
//
//class Dog {
//  func bark() {
//    print("멍멍")
//  }
//}
//
//class Poodle:Dog{
//    override func bark() {
//      print("멍멍1")
//    }
//}
//class Husky:Dog{
//    override func bark() {
//      print("멍멍2")
//    }
//}
//
//class Bulldog:Dog{
//    override func bark() {
//      print("멍멍3")
//    }
//}
//
//var duck1 = Poodle()
//var duck2 = Husky()
//var duck3 = Bulldog()
//duck1.bark()
//duck2.bark()
//duck3.bark()




//이미지처럼 Animal, Human, Pet, Cat 클래스 정의
//상속을 적용해 필요한 속성을 모두 가지면서도 각각 다른 속성과 값을 지닐 수 있도록 구현

class Animal {
    var brain: Bool = true
    var legs: Int = 0
    
    init(_ brain: Bool, _ legs: Int){
        self.brain = brain
        self.legs = legs
    }
}

class Human: Animal {
    init() {
        super.init(true,2)
    }
}

class Pet: Animal {
    var fieas: Int
    init() {
        self.fieas = 4
        super.init(true,4)
    }
    init(fieas: Int) {
        self.fieas = fieas
        super.init(true,4)
    }
}
class Dog: Pet {
    override init(){
        super.init(fieas: 8)
    }
}
class Cat: Pet{
    override init(){
        super.init(fieas: 4)
    }
}

var du11 = Dog()
du11.legs
