
import UIKit
var temperatureInFahrenheit = 0

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


switch temperatureInFahrenheit{
case 32...:
  print("It's very cold. Consider wearing a scarf.")
case ...82:
  print("It's really warm. Don't forget to wear sunscreen.")
  default:
  print("It's not that cold. Wear a t-shirt.")
}


//어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)

let duck = 29
switch duck {
case 0:
    print("\(duck)은 0이다")
case let x where x%2 == 1:
  print("\(x) 은 홀수")
case let x where  x%2 == 0 :
  print("\(x) 은 짝수")

  print("() is just some arbitrary point")
default:
    break
}

let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)
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

var duck1 = 3
for _ in 1...10 {
    duck1 *= 3
}
print(duck1)

for i in (0...10).reversed(){
    print(i)
}


func duck(_ duck: Int)->Int {
    var sum = 0
    var i = 1
    repeat {
        sum += i
        i += 1
    } while i <= duck
    return sum
}

print(duck(3))


for i in 1...10{
    for j in 1...10 {
        if ( j % 2) == 1{
            print(j)
            break
        }
    }
}
OUTER: for i in 0 ... 3 {
  INNER: for j in 0...3 {
    if i > 1 {
      print("j :", j)
//      continue INNER
      break OUTER
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}
//Conditional Statements
//- 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
func scoreCheck(_ score: Double) -> String{
    switch score {
    case 4.5:
        return "A+"
    case 4:
        return "A"
    case 3.5:
        return "B+"
    case 3:
        return "B"
    case 2.5:
        return "C+"
    case 2:
        return "C"
    case 1.5:
        return "D+"
    case 1:
        return "D"
    default:
        return "F"
    }
}
print(scoreCheck(4.5))
//- 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
//- 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
//  (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
func plusCheck(a: (Int, Int, Int)) -> Bool {
    switch a{
    case let (x,y,z) where (x * y * z) > 0:
        return true
    case let (x,y,z) where (x * y * z) < 0:
        return false
    default:
        return false
    }
}
print(plusCheck(a: (3 , 4 , 15)))

//Loops
//반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
//- 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
// (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//  ex) 5! = 5 x 4 x 3 x 2 x 1
func factorial(_ number: Int)->Int{
    var result = 1
    for i in 1...number {
        result *= i
    }
    return result
}

print(factorial(5))
//- 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
// (2, 5 를 입력한 경우 결과는 2의 5제곱)

func makeNum(_ num1: Int,_ num2: Int)->Int {
    var result = 1
    for i in 1...num2{
        result *= num1
    }
    
    return result
}
print(makeNum(2, 3))
//- 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//  (1234 인 경우 각 자리 숫자를 합치면 10)

print(1234%10)
func goodSum(_ number: Int)->Int {
    var result = 0
    var num = number
    while num > 0 {
        result += num % 10
        num = num / 10
    }
    return result
}

print(goodSum(1234))
//Control Transfer

//- 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//  그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
func sumNum(_ number: Int)->Int {
    var sum = 0
    var i = 1
    repeat {
        sum += i
        if sum > 2000 {
            return sum
        }
        i += 1
    } while i <= number
    return sum
}
 
print(sumNum(1000))
//- 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func abcde()-> Int {
    var result = 0
    for i in 1...50{
        
        if (20...30).contains(i) {
            continue
        }
        result += i
    }
    return result
}
print(abcde())








print(sumNum(1000))
//- 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func abcde1()-> Int {
    var result = 0
    for i in 1...50{
        
        if (20...30).contains(i) {
            continue
        }
        result += i
    }
    return result
}
print(abcde())







