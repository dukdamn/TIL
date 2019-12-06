//: [Previous](@previous)
/*:
 # Type Casting
 ---
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/***************************************************
 Shape
  - Rectangle
  - Triangle
  - Circle
 모두 draw() 오버라이드
 ***************************************************/


/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
*/


let rect = Rectangle()
rect.color
rect.cornerRadius

//(rect as Shape).color                 //흰색
//(rect as Shape).cornerRadius          //할당을 받지 못함
//(rect as Rectangle).color             // 흰색
//(rect as Rectangle).cornerRadius



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

//upcastedRect.color                    // 컴파일 타이밍에 값이 아니라 런타임에 값을 내뱉음
//upcastedRect.cornerRadius             // 오류

//(upcastedRect as Shape).color
//(upcastedRect as Rectangle).color     // 부모클래스에서 자식클래스로 갈떄는 as 불가능!!
// 부모 -> 자식
// 자식클래스는 보모 클래스 무조건 하나
// 보모 클래스는 자식 클래스가 몇개인지 몰라서 as 가 안댐

/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

/*
다운 캐스팅
- 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
- 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
*/

// Rectangle <- Shape
// let human: Human = strudent()
// 왜 ?
// 자식 타입 <- 부모 타입 (X)
// 부모 타입 <- 자식 타입 (X)
let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle

//downcastedRect: Rectangle = shapeRect as? Rectangle  //
//downcastedRect = shapeRect as! Rectangle  //

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   // 오류
//(value as? Float) is Float  // false 옵셔널을 가져서
//(value as! Float) is Float  // 런타임오류


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle]
/*:
 ---
 ### Question
 - 아래 for 문에 대한 실행 결과는?
 ---
 */
//for elem in list {            //세명다 공통의 클래스를 가지고 있어서
//  if elem is Shape {
//    print("shape instance")
//  } else if elem is Rectangle {
//    print("rect instance")
//  } else if elem is Triangle {
//    print("triangle instance")
//  }
//}



print("\n---------- [ ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle]
for element in list  {
  element.draw()
}           // 실제 할당된 인스턴스의 함수들이 실행됨


//: [Next](@next)
