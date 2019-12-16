# OOP(Object-Oriented Programming)

```
패러다임 : 어떤 시대, 분야에서의 특징적인 사고 방식, 인식의 쳬계, 틀
프로그램을 설계하는 방식에 대한 개념 / 방법론
프로그래머에게 프로그래밍의 관점을 갖게 해주고 결정하는 역할

* 비구조적 (Non-Structured)  /  구조적 (Structured)
* 명령형 (Imperative)  /  선언형 (Declarative) 
* 절차적 (Procedural)  / 객체지향 (Object-Oriented)  / 함수형 (Functional)
* 배치 (Batch)  /  이벤트 기반 (Event-Based)
* etc…

구조적 프로그래밍 : 기능과 정차 중심 (위에서 아래) - 에츠허르 데이크스트라
객체지향 프로그래밍 : 객체와 관계 중심 - 앨런 케이
```

## Multi Paradigm Language

```
Objective-C : OOP 언어
Swift : POP 를 지향하는 멀티 패러다임 언어
```

[ 주요 패러다임]

- POP : Protocol-Oriented Programming
- OOP : Object-Oriented Programming
- FP : Functional Programming



## Object-Oriented Programming

```
객체지향 프로그래밍 이란 캡슐화, 다형성, 상속 을 이용하여 코드 재사용을 증가시키고, 유지보수를 감소시키는 장점을 얻기 위해서 객체들을 연결시켜 프로그래밍 하는 것
```

언어 또는 기술이 다음 사항들을 직접 지원한다면 객체 지향

- 추상화 : 클래스나 객체를 제공
- 상속 : 이미 존재하는 것으로부터 새로운 추상화를 만들어 낼 능력을 제공
- 런타임 다형성 : 수행 시간에 바인딩 할 수 있는 어떠한 폼을 제공

```
단순한 데이터 처리 흐름에(C)서 벗어나 각 역할을 지닌 객체들의 상호작용으로 동작
객체 : 데이터 (상태) + 메서드 (행위)
최초의 OOP 언어 : Smalltalk    /  Smalltalk + C —> Objective-C
```

## Object(객체)

여러 관점의 개념으로 나뉜다

- 모델링 관점 : 객체는 명확한 의미를 담고 있는 대상 또는 개념이다.
- 프로그래머 관점 : 객체는 클라스에서 생성된 변수이다.
- 소프트웨어 개발 관점 : 객체는 소프트웨어 개발 대상으로, 어떤 한 시점에서 객체 상태를 나타내는 데이터와 해당하는 데이터를 처리하고 참조하는 동작을 의미하는 매서드(함수)를 모아 놓은 '데이터 + 매서드' 형태의 소프트웨어 모델이다.
- 객체지향 프로그래밍 관점 : 객체는 데이터와 함수를 속성(attribute)과 매서드(method) 용어를 구현한다.

```
객체 지향 프로그래밍 - 각 객체와 그 객체들간의 관계를 설계하는 것
```

## Class, Object

```
"많은 개체들이 공통된 명칭을  가질 때 그것들은 언제나  또 하나의 이데아, 즉 형상을 갖는다. 가령 침대는 무수히 많지만 침대의 이데아, 즉 그 형상은 오직 하나이다. 여러가지 개개의 침대는 실재가 아니며 오직 그 이데아의 모사(模寫)에 의해 만들어졌을 뿐이다.”  - 플라톤
```

[Class]

- 추상 (abstract), 표현 대상에 대한 이데아(형상)
- 이상적인 존재 (이미지, 설계도, 틀, 설명서)
- 공통의 특징

[Object]

- 실체 (instance), 추상을 실체화한 대상
- 이데아의 모사
- 개별 속성

## Create Instance

```
Objective-C 인스턴스 생성 
- [[ClassName alloc] init];
Swift 인스턴스 생성 
- ClassName()
```

재사용 캡슐 접근권한 응집성 관리 유지보수 상속 등 장점

명령형보다는 선언형 프로그램의 선언하는 이유는

객체지향적 프로그래밍 

- 병렬적 처리

병렬적 처리에서 발생할수있는 문젝 생겨 함수형 프로그래밍이 발전댐

사이드 임펙트



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

