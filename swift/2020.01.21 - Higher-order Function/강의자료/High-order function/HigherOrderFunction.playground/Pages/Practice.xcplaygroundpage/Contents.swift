//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
  
  return pets.filter{ $0.type == .dog }.map{ $0.age }.reduce(0) { $0 + $1 }
}
sumDogAge(pets: myPet)

// 2번

func oneYearOlder(of pets: [Pet]) -> [Pet] {
  
  
  return pets.map{ Pet(type: $0.type, age: $0.age + 1)}
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")


let immutableArray = Array(1...40)
func makeArray(nums: [Int]) -> [Int] {
  var duck: [Int] = []
  for (i, j) in nums.enumerated() {
    duck.append( i * j )
  }
  return duck
}
func checkNum(num: Int) -> Bool {
  return num % 2 == 0 ? true : false
//  if num % 2 == 0 {
//    return true
//  } else {
//    return false
//  }
}
func sumNums(nums: [Int]) -> Int {
  var sumNum = 0
  for i in nums {
    sumNum += i
  }
  return sumNum
}

let practice2 = immutableArray
  .enumerated()
  .map{ $0 * $1}
  .filter{ $0 % 2 == 0 }
  .reduce(Int()) { $0 + $1 }
let test = immutableArray
.enumerated()
.map(*)
.filter{ $0 & 1 == 0 }
.reduce(0, + )
print(practice2)


let array = ["1j", "2d", "3", "4"]

let m1 = array.map({ Int($0) })
let f1 = array.compactMap({ Int($0) })
let m2 = array.map({ Int($0) })[0]
let f2 = array.compactMap({ Int($0) })[0]
print(m1,f1,m2,f2)


//: [Next](@next)
