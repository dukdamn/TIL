//: [Previous](@previous)
/*:
 ---
 ## forEach
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
 ---
 */
print("\n---------- [ forEach ] ----------\n")

let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num + 1)
}
print("\n----------[duck]----------\n")


immutableArray.forEach { num in
  print(num, terminator: " ")
}
print("\n----------[duck]----------\n")

//생략
immutableArray.forEach {
  print($0, terminator: " ")
}
print()


func printParam(_ num: Int) {
  print(num, terminator: " ")
}
immutableArray.forEach(printParam(_:))
print()


/*:
 ---
 ### Question
 - forEach 와 for 문의 차이점은?
 - 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현해본 뒤 for 와 비교하여 설명
 ---
 */
// forEach 와 for 문의 차이점은?
//
for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()

(1...10)
  .filter({ $0 < 9})
  .forEach {
//  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
//let forEachTest = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//forEachTest.forEach{
//  if $0 > 8 {
//    return
//  }
//  print($0, terminator: " ")
//}

/*:
 ---
 ## map
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
 ---
 */

print("\n---------- [ Map ] ----------\n")

let names = ["Chris", "Alex", "Bob", "Barry"]



let ages = ["1", "2", "3"]
names.map { $0 + "'s name" }.forEach { print($0) }
let y = ages.map{ Int($0) }
type(of: y)
let intArr = Array<Int>(repeating: 2, count: 10)
//for (idx, value) in intArr.enumerated() {
//  idx + value
//}


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



/*:
 ---
 ## filter
 - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
 ---
 */
print("\n---------- [ filter ] ----------\n")

// let names = ["Chris", "Alex", "Bob", "Barry"]

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


/*:
 ---
 ## reduce
 - 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입
 ---
 */
print("\n---------- [ reduce ] ----------\n")

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

/*:
 ---
 ### Question
 - 문자열 배열을 reduce를 이용해 하나의 문자열로 합치기
 - 숫자 배열을 reduce를 이용해 하나의 문자열로 합치기
 ---
 */
// 아래 둘 모두 reduce를 이용해 "123" 이라는 문자열이 되도록 만들기
let duck1 = ["1", "2", "3"].reduce("") { (sum: String, num: String) in
  return sum + num
}
let test2 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(duck1)
let duck2 = [1, 2, 3].reduce("") { $0 + String($1) }
print(duck2)
let duck3 = [1, 2, 3,4,6].reduce(String()) { $0 + String($1) }
print(duck3)
let duck4 = [1,2,3,4,5,6].reduce(Double()) { (sum: Double, duck: Int) in
  sum + Double(duck)
}



print(duck4)
/*:
 ---
 ## compactMap
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여 변형된 새 컬렉션 반환
 - 옵셔널 제거
 ---
 */
print("\n---------- [ compactMap ] ----------\n")

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

/*:
 ---
 ## flatMap
 - 중첩된 컬렉션을 하나의 컬렉션으로 병합
 ---
 */
print("\n---------- [ flatMap ] ----------\n")

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




/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ A. for vs forEach ] ----------\n")

/*
 for문은 반복문이므로 break, continue 키워드 사용
 forEach문은 함수(클로져)이므로 break, continue 대신 return 키워드 사용
 */

for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()


print("\n---------- [ A. reduce ] ----------\n")

let merge1 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(merge1)

let merge2 = [1, 2, 3].reduce("") { $0 + String($1) }
print(merge2)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }






//: [Next](@next)
