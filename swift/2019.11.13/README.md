## Array 배열

### Ordered Collection 순서가 있는 배열

### Zero-based Inter Index

var variableArray = [1,2]

variableArray[] <- 0 에서 시작 1에서 시작이 아니구

#### Array Type

```swift
var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []
arrayFromLit
//let emptyArray: [String] = []
//let emptyArray = []     error 추론할 타입이 없어서
```

#### Initialize 초기화

```swift
// Type Annotation
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]

// Type Inference 추론도 가능!!
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)
["iOS","iOS","iOS","iOS","iOS"]
// Error
//let strArray5 = ["apple", 3.14, 1]  안에 타입이 달라서!!
```

#### 배열의 함수

```swift
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count				 //배열의 수




if !fruits.isEmpty {										// 배열에 비어있는지 확인
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}
// 값을 찾을떄 많이 사용 Searching
               0        1          2        3
// fruits = ["a", "b", "c", endIndex]
//fruits.startIndex
//fruits.endIndex

fruits[fruits.startIndex]
fruits[fruits.endIndex - 1]

fruits.contains("a")				//포함되있는지 아닌지 		bool타입

if fruits.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

if let index = fruits.firstIndex(of: "D") {
  print("index of D: \(index)")
} else {
  print("no index")
}
//let idx1 = alphabet.firstIndex(of: "D")
//print(idx1)

//let idx2 = alphabet.firstIndex(of: "Q")
//print(idx2)

//값을 추가할떄 사용 Add a new Element
/var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")
alphabetArray += ["C"]
apphabetArray += "C" error
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2    //배열 합치기 가능	

//alphabetArray.append(5.0)				//다른 타입 추가 가능
//alphabetArray + 1								//단순 더하기 안댐

alphabetArray.insert("S", at: 0)	//인덱스에 맞게 추가
alphabetArray.insert("F", at: 3)
alphabetArray

```

#### Change an Existing Element	

```swift
var alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"
alphabetArray


1...5
1..<5
1...

var alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]
alphabetArray

alphabetArray[2...] = ["Q", "W"]
alphabetArray   // 결과?
```

#### 배열 요소 제 Remove an Element

```swift
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기 바로 지우는 함수 없어 Index 찾기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {
  alphabetArray.remove(at: indexC)
}
alphabetArray

```

#### 배열 정렬Sorting

```swift
alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()				//섞어 준다

alphabetArray.sort()					//오름차순 정렬
alphabetArray

// shuffle vs shuffled				
// sorted vs sort

//func sorted() -> [Element]
//mutating func sort()

alphabetArray.shuffle()				//자기 자시닝 변환
alphabetArray.shuffled()			//변형값 반환

var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray



// sort by closure syntax 		//내림차순

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray

```

#### 배열의 열거 Enumerating an Array

```swift
// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) {
    print("\(index) - \(value)")
  }
}


for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {
  print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
  print("\(index) - \(element)")
}
```



## Dictionary

Element = Unique Key + Value

Unordered Collection

### Dictionary Literal

```swift
//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
//var dictFromLiteral = [1: "value 1", 2: "value 2"]
//var dictFromLiteral = ["1": 1, "2": 2]
//dictFromLiteral = [:]

// 오류
//var dictFromLiteral = [:]
```



### Dictionary Type

```swift
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]
```



#### Number of Elements

```swift
print("\n---------- [ Number of Elements ] ----------\n")

var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}
```



#### Retrieve an Element

```swift
print("\n---------- [ Retrieve ] ----------\n")

words["A"]
words["Q"]

if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)
print(words.values)

let keys = Array(words.keys)
let values = Array(words.values)
```



#### Enumerating an Dictionary 사전 순회

```swift
print("\n---------- [ Enumerating ] ----------\n")

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {
  print("Key :", key)
}

for (_, value) in dict {
  print("Value :", value)
}

for value in dict.values {
  print("Value :", value)
}
```

#### Dictionary 검색

```swift
print("\n---------- [ Searching ] ----------\n")

//var words = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, _) in words {
  if key == "A" {
    print("contains A key.")
  }
}


if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }) {
  print("contains A key.")
}

```

#### Dictionary 추가

```swift
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"				//추가
words

words["B"] = "Blue"
words
```

#### Change an Existing Element 값 변화

```swift
print("\n---------- [ Change ] ----------\n")

words = [:]
words["A"] = "Application"
words

words["A"] = "App"
words


// 키가 없으면 데이터 추가 후 nil 반환,
// 키가 이미 있으면 데이터 업데이트 후 oldValue 반환

if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("Insert \(words["A"]!)")
}
words


if let oldValue = words.updateValue("Steve Jobs", forKey: "S") {
  print("\(oldValue) => \(words["S"]!)")
} else {
  print("Add S Key with \(words["S"]!)")
}
words
```

#### Remove an Element 사전 삭제

```swift
print("\n---------- [ Remove ] ----------\n")

words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
words["S"] = nil						//키가 "S"인 value 삭제
words["Z"] = nil						//어차피 없어서 그대로 
words

// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
  print("\(removedValue) removed!")
}
words

words.removeAll()
```

#### Nested 사전안에 배열

```swift
print("\n---------- [ Nested ] ----------\n")

var dict1 = [String: [String]]()
//dict1["arr"] = "A"
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: String]]()
dict2["user"] = [
  "name": "나개발",
  "job": "iOS 개발자",
  "hobby": "코딩",
]
dict2



// 예
[
  "name": "나개발",
  "job": "iOS 개발자",
  "age": 20,
  "hobby": "코딩",
  "apps": [
    "이런 앱",
    "저런 앱",
    "잘된 앱",
    "망한 앱",
  ],
  "teamMember": [
    "designer": "김철수",
    "marketer": "홍길동"
  ]
] as [String: Any]
```



## Set

배열과 사전에 비해 사용이 적다

순서가 없다

값을 중복할수 없다

동일한 형태를 지닌다

### Set 초기화 선언

```swift
//let fruitsArr = ["Apple", "Orange", "Melon"]
//let numbersArr = [1, 2, 3, 3, 3]
//let emptyArr = [String]()


let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()
```

### Number of Elements

```swift
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

```

### Searching 찾기

```swift
print("\n---------- [ Searching ] ----------\n")



let x: Set = [1, 2, 3, 4, 5]
let y: Set = [1, 2, 3, 4, 5]
x
y

//fruitsSet[0]    // 순서 X -> Index X
x.first   // O


if fruitsSet.contains("Apple") {
  print("Contains Apple")
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
for element in productSet {
  if element.hasPrefix("i") {					//첫번쨰 갑싱 i인가
    print(element)
  }
}
```



### Add a New Element 추가

```swift
print("\n---------- [ Add ] ----------\n")

//[1,2,3].append(1)
//[1,2,3].insert(2, at: 0)

var stringSet: Set<String> = []
stringSet.insert("Apple")
stringSet

stringSet.insert("Orange")
stringSet

stringSet.insert("Orange")
stringSet
```



### Remove an Element 제거

```swift
print("\n---------- [ Remove ] ----------\n")

stringSet = ["Apple", "Orange", "Melon"]

stringSet.remove("Apple")

if let removed = stringSet.remove("Orange") {
  print("\(removed) has been removed!")
}

stringSet

stringSet.removeAll()
```

### Compare two sets 비교

```swift
print("\n---------- [ Compare ] ----------\n")

var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}


var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])	

favoriteFruits1 == favoriteFruits2								//true
favoriteFruits1.elementsEqual(favoriteFruits2)		//false

// 포함 관계 여부. 상위/하위 집합.
// group1 ⊇ group2
let group1: Set = ["A", "B", "C"]
let group2: Set = ["A", "B"]

// superset
group1.isSuperset(of: group2)
group1.isStrictSuperset(of: group2)
// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
group1.isStrictSuperset(of: group1)

// subset
group2.isSubset(of: group1)
group2.isStrictSubset(of: group1)
group2.isStrictSubset(of: group2)
```

