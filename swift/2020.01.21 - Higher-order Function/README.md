



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

### reduce

컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환. e.g. Int, String 타입

### flatMap

중첩된 컬렉션을 하나의 컬렉션으로 병합

### compactMap

컬렉션의 요수 중 옵셔널이 있을 경우 제거

(flatMap으로 사용하다가 Swift 4.1 에서 compactMap 으로 변경됨)