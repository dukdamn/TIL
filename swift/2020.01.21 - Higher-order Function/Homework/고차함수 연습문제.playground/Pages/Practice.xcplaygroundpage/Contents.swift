//: [Previous](@previous)
import Foundation

/*:
 ---
 ## Practice
 ---
 */

/*
 [ 1번 문제 ]
 let numbers = [-2, -1, 0, 1, 2]
 numbers.compactMap { $0 >= 0 ? $0 : nil }
 => [0, 1, 2]
 
 위와 같이 compactMap을 이용했을 때와 동일한 결과가 나오도록 compactMap 없이 구현
 */

print("\n---------- [ 1번 문제 ] ----------\n")
var problem1 = [Int]()
for i in [-2, -1, 0, 1, 2] {
  if i >= 0 {
    problem1.append(i)
  }
}
print(problem1)
let problem = [-2, -1, 0, 1, 2].filter{ $0 >= 0 }
print(problem)
/*
 [ 2번 문제 ]
 
 let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
 nestedArr.flatMap { $0 }
 => [1, 2, 3, 9, 8, 7, -1, 0, 1]
 
 위와 같이 flatMap을 이용했을 때와 동일한 결과가 나오도록 flatMap 없이 구현
 */

print("\n---------- [ 2번 문제 ] ----------\n")

let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
nestedArr
var problem2 = [Int]()
for i in nestedArr {
  for j in i {
    problem2.append(j)
  }
}
print(problem2)
nestedArr
  .reduce([]) { $0 + $1  }
print(nestedArr
.reduce([]) { $0 + $1  })



/*
 [ 3번 문제 ]
 Q. map 과 flatMap, compactMap 을 이용하여 다음 3가지 결과값이 나오도록 출력해보기
 
 1. [[1, 2, 3], [5], [6], []]
 2. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 3. [1, 2, 3, 5, 6]
 */

print("\n---------- [ 3번 문제 ] ----------\n")

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
print(array.map{ $0.compactMap{ $0 }})
print(array.compactMap{ $0 }.flatMap{ $0 })
print(array.flatMap{ $0 }.compactMap{ $0 })

print("\n---------- [check] ----------\n")




//: [Next](@next)
