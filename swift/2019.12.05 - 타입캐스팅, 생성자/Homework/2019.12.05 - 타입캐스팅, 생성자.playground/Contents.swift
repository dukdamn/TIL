import UIKit

var str = "Hello, playground"
//******************
//** Type Casting **
//******************
//[ 과제 ]
//1.
func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)
type(of: addTwoValues(a: 2, b: 3))
//위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
//task1 + task1
(task1 as! Int) + (task1 as! Int)
if let duck = task1 as? Int {
    duck + duck
}

//[ 도전 과제 ]
//1.
//let task2: Any = addTwoValues
//과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
//두 변수의 더하기 연산이 제대로 동작하도록 할 것
//(addTwoValues의 각 파라미터에는 원하는 값 입력)
//task2 + task2

let task2: Any = addTwoValues
type(of: task2)
if let duck = task2 as? (Int,Int) -> Int {
    duck(23,23) + duck(23,23)
//    type(of: task2)
//    type(of: duck)
}


//2.
class Car1 {}
let values: [Any] = [
  0,
  0.0,
  (2.0, Double.pi),
  Car1(),
  { (str: String) -> Int in str.count }
]
//print(type(of: { (str: String) -> Int in str.count }))

for value in values {
  switch value {
  case let x where ((value as? Int) != nil):
    print(x)
  case let x where ((value as? Double) != nil):
    print(x)
  case let x where ((value as? (Double, Double)) != nil):
    print(x)
  case let x where ((value as? Car1) != nil):
    print(x)
  case let x where ((value as? (String) -> Int) != nil):
    print(x)
  default:
    print("duck")
    }
}

//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기



//*****************
//** Initializer **
//*****************
//[ 과제 ]
//1. 생성자 구현
//- Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
//- Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
//- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가

class Vehicle {
    let name: String
    var maxSpeed: Int
    init() {
        self.name = ""
        self.maxSpeed = 0
    }
    init(maxSpeed: Int) {
        self.name = "duck"
        self.maxSpeed = maxSpeed
    }
    init(name: String, maxSpeed: Int){
        self.maxSpeed = maxSpeed
        self.name = name
    }
    
    
}
//class Car: Vehicle {
//    var modelYear: Int
//    var numberOfSeats: Int
//    init?(modelYear: Int, numberOfSeats: Int) {
//      guard modelYear > 0 || numberOfSeats > 0 else { return nil }
//      self.modelYear = modelYear
//      self.numberOfSeats = numberOfSeats
//    }
//}

class Bus: Vehicle {
    let isDoubleDecker: Bool
    init(isDoubleDecker: Bool, maxSpeed: Int) {
        self.isDoubleDecker = isDoubleDecker
        super.init(maxSpeed: maxSpeed)
    }
    
    convenience init(isDoubleDecker: Bool) {
        self.init(isDoubleDecker: isDoubleDecker, maxSpeed: 100)
    }
}

var duck = Bus(isDoubleDecker: true)
var duck1 = Vehicle()
duck.maxSpeed
duck1.maxSpeed
