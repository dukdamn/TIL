# Access Control

```
다른 모듈의 코드 또는 다른 소스 파일 등으로부터 접근을 제한하는것
세부 구현 내용을 숨기고 접근할 수 있는 인터 페이스 지정가능
```

- 모듈(Module)

-imprort 를 통해 다른 모듈로 부터 불러들일 수 있는 하나의 코드 배포 단위

-Library / Framework / Application 등

- 소스 파일 (Source File)

-모듈 내에 포함된 각각의 Swift 소스 코드 파일

## Access Levels

```
Swift 에서는 5가지의 다른 접근 레벨 제공
open (가장 개방적) > public > internal (기본 레벨) > fileprivate > private (가장 제한적)
```

![스크린샷 2019-11-19 오후 1.08.58](/Users/hwangjeongdeog/Desktop/image/스크린샷 2019-11-19 오후 1.08.58.png)



![스크린샷 2019-11-19 오후 1.12.21](/Users/hwangjeongdeog/Desktop/image/스크린샷 2019-11-19 오후 1.12.21.png)





### Open(개방 접근수준), Public (공개 접근수준)

```swift
/***************************************************
 Open / Public
 ***************************************************/

open class SomeOpenClass {
  open var name = "name"
  public var age = 20
}

public class SomePublicClass {
  public var name = "name"
  var age = 20
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age

```



### Internal(내부 접근수준)

기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근 수준

```swift
/***************************************************
 Internal
 ***************************************************/

class SomeInternalClass {
  internal var name = "name"
  internal var age = 0
}

//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age

```



### Fileprivate(파일외부비공개 접근수준)

```swift
/***************************************************
 fileprivate
 ***************************************************/

class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age

```



### Private(비공개 접근수준)

```swift
class SomePrivateClass {
  private var name = "name"
  private var age = 0
  
  func someFunction() {
    print(name)
  }
}

//let somePrivateClass = SomePrivateClass()
//somePrivateClass.someFunction()
//somePrivateClass.name
//somePrivateClass.age
```



## Nested Types

```swift
Private  ->  Fileprivate
Fileprivate  ->  Fileprivate
Internal  ->  Internal
Public  ->  Internal
Open  ->  Internal
```



## Getters and Setters

```swift
/***************************************************
 Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐
 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능
 ***************************************************/

/***************************************************
 Setter 설정
 ***************************************************/

class TrackedString {
//  var numberOfEdits = 0

//  private var numberOfEdits = 0
  private(set) var numberOfEdits = 0	// (set) set에서만 수정할수 있다

  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}


let trackedString = TrackedString()
trackedString.numberOfEdits
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits

trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits

trackedString.value = "value changed"
trackedString.numberOfEdits

//trackedString.numberOfEdits = 0
//trackedString.numberOfEdits


/***************************************************
 Getter 와 Setter 에 대해 각각 명시적으로 표현
 ***************************************************/

public class TrackedString1 {
  internal private(set) var numberOfEdits = 0
  
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  
  public init() {}
}
```

## Type

### Tuple

```swift
/***************************************************
 Tuple 유형의 접근 수준은 자동으로 추론되며 명시적으로 지정 불가능
 튜플 유형에 대한 엑세스 수준은 해당 튜플에 사용된 모든 유형 중 가장 제한적인 엑세스 수준에 맞춰지게 됨
 ***************************************************/

internal class SomeInternalClass {}
private class SomePrivateClass {}

fileprivate func returnTupleFunction() -> (SomeInternalClass, SomePrivateClass) {
  return (SomeInternalClass(), SomePrivateClass())
}

//let result = returnTupleFunction()
fileprivate let result = returnTupleFunction()

```

### Enumeration Types

```swift
private enum 방위1 {
  case 동, 서, 남, 북
}

//let enumeration = 방위1.남
fileprivate let enumeration = 방위1.남

switch enumeration {
case .동, .서:
  print("좌우")
case .남, .북:
  print("상하")
}


// 다음과 같이 각 case 별로 개별적인 접근 수준 설정 불가
//enum 방위2 {
//  fileprivate case 동
//  fileprivate case 서
//  fileprivate case 남
//  fileprivate case 북
//}
```

### Type Aliases

```swift
class AliasClass {
  let someProperty = 1
}

//public typealias Typealiases = AliasClass
internal typealias Typealiases = AliasClass
//fileprivate typealias Typealiases = AliasClass


let aliasesInstance = Typealiases()
aliasesInstance.someProperty
```

