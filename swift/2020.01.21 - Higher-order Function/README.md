



# Higher-order Function

고차함수란?

- 하나 이상의 함수를 인자로 취하는 함수
- 함수를 결과로 반환하는 함수

Higher-order Function이 되기 위해서는 함수가 First-class Citizen 이어야 한다.

## First-class citizen

1급객체 (First-class citizen)

- 변수나 데이터에 할당할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴할 수 있어야 한다.

```swift
func firstClassCitizen() {
  print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
	return parameter
}
let returnValue = function(firstClassCitizen)
returnValue()
 
```



## Collection Type

#### ![스크린샷 2020-01-21 오후 1.17.04](https://tva1.sinaimg.cn/large/006tNbRwgy1gb429y6cnsj32100qywt9.jpg)



## in Swift

### forEach

컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

```swift
let immutableArray = [1, 2, 3, 4]

immutableArray.forEach { num in
  print(num, terminator: " ")
}

//생략
immutableArray.forEach {
  print($0, terminator: " ")
}
```



### map

컬렉션의 각 요서(Element)에 동일 연산을 적용하며, 변형된 새 컬렉션 반환

```swift
let intArr = Array<Int>(repeating: 2, count: 10)

// for 문 비교
var numArr = [Int]()
for (idx, value) in intArr.enumerated() {
  numArr.append(idx + value)
}
print(numArr)

// map
let indexPlusElement = intArr.enumerated().map {
  return $0 + $1
}
print(indexPlusElement)
```



### filter

컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환

```swift
let names = ["Chris", "Alex", "Bob", "Barry"]

let containBNames = names
  .filter { (name) -> Bool in
    return name.contains("B")
  }
print(containBNames)

names.filter { $0.contains("B") }

//nmaes.fiter{ _ in true }
let names2 = ["Alex", "Alex", "Alex", "Alex", "Alex", "Alex"]
let countAlexNames = names2
  .filter { $0 == "Alex" }
  .count
print(countAlexNames)
```



### reduce

컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환. e.g. Int, String 타입

```swift
/*
 (1...100)
   .reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)
 
 Result Type - 결과로 얻고자하는 값의 타입
 
 initialResult - 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
 */
let check = (1...100).reduce(0) { (sum: Int, next: Int) -> Int in
  return sum + next
}
//print(check)

let sum1to100 = (1...100).reduce(0) { (sum: Int, next: Int) in
  return sum + next
}
print(sum1to100)
// 0 + 1 = 1
// 1 + 2 = 3
// 3 + 3 = 6
// 6 + 4 = 10
// ....

print((1...100).reduce(0) { $0 + $1 })
print((1...100).reduce(0, +))
//직접 더하는 형태 X
//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}


print(["123", "456"].reduce(100) { $0 + Int($1)! })

```



### flatMap

중첩된 컬렉션을 하나의 컬렉션으로 병합

```swift
let nestedArr: [[Int]] = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
print(nestedArr)
print(nestedArr.flatMap { $0 })


let nestedArr2: [[[Int]]] = [[[1, 2], [3, 4], [5, 6]], [[7, 8], [9, 10]]]
let flattenNumbers1 = nestedArr2.flatMap { $0 }
print(flattenNumbers1)

let flattenNumbers2 = flattenNumbers1.flatMap { $0 }
print(flattenNumbers2)

nestedArr2
  .flatMap { $0 }
  .flatMap { $0 }
```



### compactMap

컬렉션의 요수 중 옵셔널이 있을 경우 제거

(flatMap으로 사용하다가 Swift 4.1 에서 compactMap 으로 변경됨)

```swift
let optionalStringArr = ["A", nil, "B", nil, "C"]
print(optionalStringArr)
print(optionalStringArr.compactMap { $0 })
let compactMapCheck = optionalStringArr.compactMap { $0 }
type(of: compactMapCheck)
let numbers = [-2, -1, 0, 1, 2]
let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }
print(positiveNumbers)

// map으로 할 경우 옵셔널타입으로 반환한다!
print(numbers.map { $0 >= 0 ? $0 : nil })
```

