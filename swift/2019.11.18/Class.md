

# Class

```
Value Type => struct, enum  (Stack 에 저장) 	//정적데이타
Reference Type => class  (Heap 에 저장)			//동적데이타
```

## Class 선언

```swift

 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 let <#objectName#> = <#ClassName()#>
 objectName.<#propertyName#>
 objectName.<#functionName()#>
```

## Class Initialize

- 초기화 (init)가 불필요한 경우 : 모든 저장 프로퍼티에 초기값이 설정되어 있음
- 초기화 (init)가 필요한 경우 : 저장 프로퍼티 중 하나 이상이 초기값 미설정됨

# Property

## Stored Property

- Class O			Structure O				Enumeration X

## Lazy Stored Property

- 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
- 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
- 필요한 경우가 제한적일 때
- Class O			Structure O				Enumeration X

```swift
print("\n---------- [ Lazy Property ] ----------\n")


class LazyStoredProperty {
  var width = 10.0
  var height = 20.0
  
  // 1. 외부 요인이나 다른 설정에 기반
//  var area = self.width * self.height
  lazy var area = width * height
  
  // 2. 계산 비용이 많이 드는 상황
//  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
  
  // 3. 필요한 경우가 제한적인 상황
//  func ifStatement() {
//    if true {   // 10%
//      print(area)
//    } else {    // 90%
//      print(width)
//    }
//  }
}

let lazyStored = LazyStoredProperty()
lazyStored.width = 30
lazyStored.area							// area 최초 호출되는 시점에 초기화	


// 순서 주의
let lazyStored1 = LazyStoredProperty()
lazyStored1.area
lazyStored1.width = 30
lazyStored1.area
```

## Computed Property

- 자료를 저장하지 않고 매번 호출핳ㄹ 떄마다 새로 계산
- Class O  Structure O  Enumeration O

```swift
var <#variable name#>: <#type#> {
  get {
    <#statements#>
  }
  set {
    <#variable name#> = newValue
  }
}

print("\n---------- [ Computed Property ] ----------\n")

class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
  lazy var lazyArea = width * height
  var area: Double {
    return width * height
  }
  
  // Stored + Computed get(read), set(write)
  private var _koreanWon = 0.0
  var wonToDollar: Double {
    get {
      return _koreanWon / 1136.5
    }
    set {
      _koreanWon = newValue
    }
  }
}

var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area
computed.lazyArea

computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar
```



## Property Observer

- Class O			Structure O			Enumeration X

```swift
var <#variable name#>: <#type#> = <#value#> {
	willSet {
		<#statements#>
  }
  didSet {
  	<#statements#>
  }
}

print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
  var height = 0.0
  
  var width = 0.0 {
    willSet {
      print("willSet :", width, "->", newValue)
    }
    didSet {
      print("didSet :", oldValue, "->", width)
      height = width / 2
    }
  }
}

var obs = PropertyObserver()
obs.height = 456
obs.width = 123Rectangle

```



## Type Property

- Shared						static 으로 고유 값 가짐
- Lazily Initialized      지연생성이 가능함
- 객체끼리 같은 공유값을 가지기 위하여 편의성에 의해 생성
- Class O.     Structur O.     Enumeration O

```swift
선언 - static let(var) <#propertyName#>: <#Type#>
      class var <#propertyName#>: <#Type#> { return <#code#> }
사용 - <#TypeName#>.<#propertyName#>

static: override 불가
class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능

print("\n---------- [ Type Property ] ----------\n")

class TypeProperty {
  static var unit: String = "cm"
  var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m"
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")
```



# Equatable, Identical

```swift
// 동등 연산자
1 == 1
2 == 1
"ABC" == "ABC"


class Person {
  let name = "이순신"
  let age = 30
}

let person1 = Person()
let person2 = Person()

//person1 == "이순신"    //
//person1 == person2   //		에러!
```

### Equatable Protocol

```
class User: Equatable {
  var name = "이순신"
  let age = 30
  
  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.name == rhs.name
  }
}

let user1 = User()
var user2 = User()
user1 == user2

```

### Identical

```swift
user1.name
user2.name
user1 == user2
user1 === user2


/*
 let x = 5
 let y = User()
 let z = User()
 
           x   y        z
 [ Stack ] | 5 | 0x5F17 | 0x2C90 |
                   |        |
                   ---------|----------
           ------------------         |
           |                          |
         0x2C90          0x5F16     0x5F17
 [ Heap ]  | z's user data | SomeData | y's user data |
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 */


user1.name = "홍길동"
user1.name   //
user2.name   //
user1 == user2
user1 === user2


user2 = user1

// user1 -> 0x00001  <- user2       0x00002

//user1.name
//user2.name
//user1 == user2    //
//user1 === user2   //
//
//user2.name = "세종대왕"
//user2.name
//user1.name


/*
 Identity Operators
 === : 두 상수 또는 변수가 동일한 인스턴스를 가르키는 경우 true 반환
 */

//1 === 1
//"A" === "A"

// 5 == 5
```

