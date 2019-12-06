# Type Casting

## Generic



```swift
// Generic
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)					//Int 타입으로 들어감
printGenericInfo(2.0)				//Doble 타입으로 들어감
printGenericInfo("3")				//String 타입으로 들어감
```

특정타입이 아니고 동적으로 값이 들어올떄 타입을 지정해주는 방식



## 타입비교 - is

```swift
/***************************************************
 객체 is 객체의 타입 -> Bool (true or false)
 ***************************************************/

let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교

let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
  if data is Int {
    print("Int type data :", data)
  } else if data is Double {
    print("Double type data : ", data)
  } else {
    print("String type data : ", data)
  }
}
```



## 상속 관계

```swift
/***************************************************
 자식 클래스 is 부모 클래스  -> true
 부모 클래스 is 자식 클래스  -> false
 ***************************************************/

class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}

let student = Student()
student is Human					// 자식이 부모를 포함하고 있어서 역으로 안댐
student is Baby						// false 같은걸 상속받았지 같은 타입은 아님
student is Student

let univStudent = UniversityStudent()
student is UniversityStudent
univStudent is Student

let babyArr = [Baby()]
type(of: babyArr)				/// [Baby] ,  Array<Baby>

//let anyArr1 = [1 , 2.0 , "3"]			//에러 어떤 타입인지 명확하지 않음
// Q. 그럼 다음 someArr 의 Type 은?

let someArr = [Human(), Baby(), UniversityStudent()]
type(of: someArr)				//[Human] , [AnyObject]타입

var human: Human = Student()        
type(of: human)
//컴파일하는 단계에서 컴파일러가 실제로 스튜던트라도 휴먼타입으로 인식 런타임 과정에서 실제로 실행될떄는 스튜던트라고 생각함

// Q. 그럼 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요
//타입캐스팅

```



## Type Casting

as : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러

as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환

as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

## Upcasting

```swift
/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
*/

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

let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

//upcastedRect.color                    // 컴파일 타이밍에 값이 아니라 런타임에 값을 내뱉음
//upcastedRect.cornerRadius             // 오류

//(upcastedRect as Shape).color
//(upcastedRect as Rectangle).color     // 부모클래스에서 자식클래스로 갈떄는 as 불가능!!
// 부모 -> 자식
// 자식클래스는 보모 클래스 무조건 하나
// 보모 클래스는 자식 클래스가 몇개인지 몰라서 as 가 안댐
```





## Downcasting



```swift
/***************************************************
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 ***************************************************/
 
 // Rectangle <- Shape
// let human: Human = strudent()
// 왜 ?
// 자식 타입 <- 부모 타입 (X)
// 부모 타입 <- 자식 타입 (O)
let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle

//downcastedRect: Rectangle = shapeRect as? Rectangle  //
//downcastedRect = shapeRect as! Rectangle  //
```



# Initializer

Swift 의 객체는 사용하기 전 모든 저장 프로퍼티에 대해 초기화 필수

다음 3 가지 중 하나를 택해 초기화

초기값 지정

옵셔널 타입 - nil 값으로 초기화

초기값이 없고, 옵셔널 타입이 아닌 프로퍼티에 대해서는 초기화 메서드에서 설정

## Designated Initializer

클래스에 반드시 1개 이상 필요

초기화가 필요한 모든 프로퍼티를 단독으로 초기화 가능한 Initializer

위에서 사용한 init(), init(height: Int, xPosition: Int) 가 여기에 해당

초기화 과정에서 반드시 한 번은 호출

## Conbenience Initializer

단독으로 모두 초기화할 수 없고 일부만 처리한 뒤 다른 생성자에게 나머지 부분 위임

중복되는 초기화 코드를 줄이기 위해 사용

z

```swift
class duck{
  var name: String
}
```



```swift
class Rectangle {
  var width: Int
  var height: Int
  var xPosition: Int
  var yPosition: Int
  var cornerRadius: Int
  
  init() {
    // designated init
    width = 20
    height = 20
    xPosition = 10
    yPosition = 10
    cornerRadius = 5
  }
  
  init(width: Int, height: Int, xPosition: Int, yPosition: Int, cornerRadius: Int) {
    // designated init
    self.width = width
    self.height = height
    self.xPosition = xPosition
    self.yPosition = yPosition
    self.cornerRadius = cornerRadius
    
    // self.init()  // designated init can't call designated init
  }
  
  convenience init(xPosition: Int) {
    // convenience init -> designated init -> overwrite
//    self.xPosition = xPosition // 프로퍼티의 초기화가 되야 접근할수 있따
    self.init()
    self.xPosition = xPosition
  }
  
  convenience init(width: Int, height: Int, cornerRadius: Int) {
    // convenience init -> designated init
    self.init(width: width, height: height, xPosition: 10, yPosition: 30, cornerRadius: cornerRadius)
  }

  convenience init(cornerRadius: Int) {
    // convenience init -> convenience init
    self.init(width: 20, height: 20, cornerRadius: cornerRadius)
  }
}

let rectangle1 = Rectangle(xPosition: 20)
let rectangle2 = Rectangle(cornerRadius: 5)
let rectangle3 = Rectangle(width: 10, height: 10, xPosition: 10, yPosition: 5, cornerRadius: 3)


/***************************************************
 초기화 과정은 (Convenience -> Convenience -> ... ->) Designated (최종) 순서로 동작
 Designated -> Designated 호출 불가
 ***************************************************/
```

## Failable Initializer

인스턴스 생성시 특정 조건을 만족하지 않으면 객체를 생성하지 않는 것

생성이 되면 옵셔널 타입을 반환하게 되며, 생성 실패시에는 nil 반환

## Super Class Initializing

![스크린샷 2019-12-05 오후 3.32.31](https://tva1.sinaimg.cn/large/006tNbRwgy1g9lu2auru8j30he0hbdke.jpg)

 \- 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야 함

 \- 서브 클래스는 수퍼 클래스의 지정 생성자(Designated Initializer) 호출 필요 (Convenience는 호출 불가)

 \- 수퍼 클래스의 지정 생성자가 기본 init 함수 하나만 있을 경우는

  별도로 작성하지 않아도 자동으로 super.init() 메서드 호출

 \- 생성자가 여러 개인 경우, 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 오류

  이 때는 서브 클래스에서 수퍼 클래스의 생성자를 명시적으로 선택해주어야 함.

  편의 생성자(Convenience Initializer)는 무관



```swift
/*
 자신의 프로퍼티를 초기화 하지 않은 상태로 부모 클래스의 초기화 메서드를 호출했을 경우
 초기화되지 않은 프로퍼티를 사용하게 되는 일이 발생 할 수 있음.
 
 위 코드에서는 부모클래스의 init 메서드에서 printShapeDescription() 을 호출하고 있지만
 실제 실행되는 메서드는 그것을 호출한 객체의 override 된 메서드가 실행되는 것을 확인 가능
 */


```

## Initializer의 다른 특징들

```swift
/*
 초기화 이전에 프로퍼티 사용 불가
 초기화 이전 단계에서 인스턴스 메서드 호출 불가
 - 다른 메서드 호출 중 초기화 되지 않은 프로퍼티를 사용할 수도 있기 때문에 컴파일 에러 발생
 */
```