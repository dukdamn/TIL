sudo nom install -g hero-c

hexo generate

_config.tml

이블로그의 주소 제목 내용 정리~



파싱에러  단어체크





# If statements

### if 문

```swift
if <#condition#> {
  <#code#>
}
if <#condition#> {
  <#statements#>
} else {
  <#statements#>
}
```

condition 은 Bool 값 (true, false)



### if - else if - else

```swift
temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}
```



## Question

 if ~ else if  / if 문을 2개 하는 것과 차이점?

if ~ else 에서 먼저 참이 되면 다음 else if 문을 실행햐지 않는다!!

if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?









## switch Statements

switch 문은 

```swift
switch <#value#> {
  case <#value 1#>:
  	<#respond to value 1#>
  case <#value 2#>,
  		 <#value 3#>:
  	   <#respond to value 2 or 3#>
  default:
  		 <#otherwise, do something else#>
```

switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 

ex)

```swift
print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 30

switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}
```



## Question

아래의 if - else if - else 문을 switch 문으로 바꿔보세요.

```swift
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


switch temperatureInFahrenheit{
  case ...32:
  print("It's very cold. Consider wearing a scarf.")
  case 82...:
  print("It's really warm. Don't forget to wear sunscreen.")
  default:
  print("It's not that cold. Wear a t-shirt.")
}
```



Switch 문의 경우 case , 는 or로 인식한다



Value binding

```swift
// x, y 좌표
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}

// where clause
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}
```



###  fallthrough

Swift의 경우 다른언어오 다르게 switch문에 break로 구문 탈출을 사용하지 안않는다

다음 경우로 내려가고 싶을경우 fallthrough를 사용한다

```swift
print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough
default:
  description += " an integer."
}
print(description)
```





## Early Exit

가드문 

특정조건을 만족하면 분기문 실행

만족하지 않으면 빠르게 종료~? 요런 느낌~~

조건에 맞지 않으면 바로 종료

들여쓰기 중첩 방지

```swift
if <#condition#> {
 <#code#>
 } else if <#condition#> {
 <#code#>
 }
 - 특정 조건을 만족하면 해당 분기문 실행
 
 guard <#condition#> else {
 <#code#>
 }
```



# Tuples

### Unnamed Tuple

```swift
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)

threeNumbers

threeNumbers.0
threeNumbers.1
threeNumbers.2


var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
type(of: threeValues)

threeValues

threeValues.0 = 5
threeValues
```





### Decomposition

```swift
let numbers = threeNumbers
numbers
numbers.0
numbers.1


let (first, second, third) = threeNumbers
first
second


// wildcard pattern

let (_, second1, third1) = threeNumbers
second1
third1
```



### Named Tuple

이름을 지어주는 튜플

```swift
let iOS = (language: "Swift", version: "4")

//let iOS: (language: String, version: String) = (language: "Swift", version: "4")
//let iOS: (language: String, version: String) = ("Swift", "4")
//let iOS = (language: "Swift", version: "4")

iOS.0
iOS.1

iOS.language
iOS.version


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0, a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second
```



### Comparison Operators

Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음

7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함

```swift
//var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//something1 == something2			true

//var something3: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//var something4: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//something3 == something4			false
```

### Tuple Matching

위에서 아래로

```swift
let somePoint = (1, 1)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin")
case (_, 0):
  print("\(somePoint) is on the x-axis")
case (0, _):
  print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
  print("\(somePoint) is inside the box")
default:
  print("\(somePoint) is outside of the box")
}
```

### Dictionary Enumeration

```swift
let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]

for dict in fruits {
    dict.0
    dict.1
    dict.key
    dict.value
}

for (key, value) in fruits {
  print(key, value)
}
print()

//for element in fruits {
//  // 어떤 식으로 출력해야 할까요?
//}

```

### Loop

1.For-In Loops , WhileLoops , repeat-while

print (chr, terminator: "") 세퍼레이터 확인

```swift
print("\n---------- [ for ] ----------\n")
/*
 for <#item#> in <#items#> {
 <#code#>
 }
 */

//for (int i = 0; i <= 5; i++) {
//   C 스타일의 for 문
//}

print("\n---------- [ while ] ----------\n")
/*
 while <#condition#> {
 <#code#>
 }

 - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
 */

print("\n---------- [ repeat ~ while ] ----------\n")
/*
 repeat {
 <#code#>
 } while <#condition#>
 
 - 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
 - 다른 언어에서는 do - while 문으로 많이 사용
 */
```

