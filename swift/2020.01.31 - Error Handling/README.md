# Error Handling

프로그램 동작 중 예상 가능한 오류가 발생했을 때 이를 감지하고 복구하기 위한 일련의 처리 과정

## Swift 에서 정의하는 심각도에 따른 4가지 유형의 오류

### Simple Domain Error (􏰀􏰁 􏰂􏰃􏰄 􏰅􏰆) 

명백하게 실패하도록 되어 있는 연산 또는 추측에 의한 실행 등으로 발생

예**) 1.** 숫자가 아닌 문자로부터 정수를 파싱**, 2.** 빈 배열에서 어떤 요소를 꺼내는 동작 등 - 오류에 대한 자세한 설명이 필요하지 않으며 대개 쉽게 또 즉시 에러를 처리할 수 있음**.**
 **\- Swift에는** Optional 등을 통해 잘 모델링되어 있음



### Recoverable (􏰇􏰈 􏰉􏰊􏰋 􏰅􏰆) 

- 복잡한연산을수행하는도중실패가발생할수있지만사전에미리오류를합리적으로예측할수있는작업

**예**) 파일을 읽고 쓰는 작업**,** 네트워크 연결을 통해 데이터 읽기 등 

- iOS 에서는 NSError 또는 Error 를 이용하여 처리 
  - 일반적으로 이런 오류의 무시는 좋지 않으며 위험할 수도 있으므로 오류를 처리하는 코드 작성 권장 
    - 오류 내용을 유저에게 알려주거나**,** 다시 해당 오류를 처리하는 코드를 수행하여 처리하는 것이 일반적



### Universal Error (􏰌􏰍􏰎, 􏰏􏰐􏰎 􏰅􏰆) 

- 시스템이나 어떤 다른 요인에 의한 오류 
  - 이론적으로는 복구가 가능하지만**,** 어느 지점에서 오류가 발생하는 지 예상하기 어려움



### Logic Failure 

- Logic 에 대한 오류는 프로그래머의 실수로 발생하는 것으로 프로그램적으로 컨트롤할 수 없는 오류에 해당  - 시스템에서 메시지를 남기고 abort()를 호출하거나 Exception 발생



## Propagating Errors

오류에 대한 처리를 코드의 다른 부분에서 처리하도록 throws 키워드를 명시적으로 선언 

throws 키워드가 없을 떄는 오류를 해당 함수 내에서 처리해야 함

```swift
// This function is not permitted to throw.
func foo() -> Int { }
// This functions are permitted to throw.
func bar() throws -> Int { }
func foo() throws { }
func bar(_ callback: () throws -> ()) throws { }
```



### Throws function > non throws function

```swift
// OK
func cannotThrowFunction() -> Int { return 10 }
func canThrowFunction(_ generator: () throws -> Int) -> Void { }
canThrowFunction(cannotThrowFunction)
// Error
func canThrowFunction() throws -> Int { return 10 }
func cannotThrowFunction(_ generator: () -> Int) -> Void { }
cannotThrowFunction(canThrowFunction)
```

### Swift에서의 Handling Errors Using Do-Catch

![스크린샷 2020-01-31 오후 1.25.53](https://tva1.sinaimg.cn/large/006tNbRwgy1gbfmq6cqc3j30xf0u0158.jpg)

### Define Custom Error

```swift
enum IntParsingError: Error {
  case overflow
	case invalidInput(String)
}

func parsingInteger(numString: String) throws -> Int {
	guard let num = Int(numString) else {
    throw IntParsingError.invalidInput(numString)
	}
  guard num <= Int64.max, num >= Int64.min else {
    throw IntParsingError.overflow
  }
  return num
}
```

