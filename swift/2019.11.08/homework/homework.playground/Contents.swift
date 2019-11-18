import UIKit


    
//- ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
var duck = ["p", "u", "p", "p", "y"]
if let indexC = duck.lastIndex(of: "p") {
  duck.remove(at: indexC)
}
//- 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
var duck1 = [1,2,3,4,8,9,12,13]
var duck2 = [4,5,6,7,8]
var duck3: [Int] = []

for i in duck1 {
    for j in duck2{
        if i == j{
            duck3.append(i)
        }
    }
}
print(duck3)
//- 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
duck1.max()
func getDuck(in list: [Int])->Int{
   
    var result = list[0]
    for i in list {
        if result < i {
            result = i
        }
    }
    return result
    
}
var list = [50,23,29,1,45,39,59,19,15]
print(getDuck(in: list))


//키가 String이고 값이 Int 타입인, 자료가 없는 상태의 빈 딕셔너리를 만드세요.
var dicDuk = [1: "value 1", 2: "value 2"]
var dicDuk1: [String: Int] = [:]

//Type Annotation 과 Type Inference 방식을 모두 이용해 여러 가지 데이터를 넣어 딕셔너리를 만들어보세요.
let dicDuk2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let dicDuk3 = [1: "Apple", 2: "Banana", 3: "City"]


//Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
var result = 0.0
for (_, value) in scores {
    result += Double(value)
}
print(result/Double(scores.count))
//Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
let scores1 = ["kor": 92,"eng": 88, "math": 96, "science": 89]
var scoreArr: [(String, Int)] = []
for (key, value) in scores {
    scoreArr.append((key, value))
}
//for dict in scores {
//  scoreArr.append(dict)
//}

//scoreArr = Array(scores)

//주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기

/*
패스트캠퍼스
 - 스쿨
  * iOS 스쿨
  * 백엔드 스쿨
  * 프론트엔드 스쿨
 - 캠프
  * A 강의
  * B 강의
 - 온라인
  * C 강의
  * D 강의
*/


//위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기


//[ 실습 문제 ]
//<1>
//[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
//위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
//스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
let words1: Dictionary<String, String> = ["철수": "Apple", "영희": "Banana", "진수": "City","미희": "strawberry"]
var arrDuk: [String] = []
for (key, value) in words1 {
    if value.contains("e"){
        arrDuk.append(key)
    }
}
print(arrDuk)
//<2>
//임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
func swap(_ list: [Int])->[Int] {
    var result3: [Int] = []
    for i in list {
        if (i % 2) == 1 {
            result3.append(i)
        }
    }
    for i in list {
        if (i % 2) == 0 {
            result3.append(i)
        }
    }
    return result3
}
var ssassa = [2, 8, 7, 1, 4, 3]
print(swap(ssassa))
//<3>
//0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
//입력 : [1, 3, 3, 3, 8]
//결과 : "숫자 1 : 1개, 숫자 3 : 3개, 숫자 8 : 1개"

var checkNum: [Int: Int] = [0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0]

ssassa = [1, 3, 3, 3, 8]
for i in ssassa {
    checkNum[i] = checkNum[i]! + 1
}
print(checkNum)

for (key, value) in checkNum {
    if value != 0 {
    print("숫자 \(key) : \(value)개")
  }
}


//[ 과제 ]
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201


func reverseNum(_ number: Int)->Int {
    var first: [Int] = []
    var check = number
    var resultNum = 0
    while check > 0 {
        first.append(check%10)
        check = check / 10
    }
    //print(first)
    var dudu = first.count
    var num111 = 0
    for num in first {
        num111 = num
        for i in 1...dudu {
            num111 *= 10
        }
        resultNum = resultNum + num111
        dudu -= 1
    }
    
    return resultNum/10
}
reverseNum(10294)
//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770
var asasd = String(123)
type(of: asasd)
print(asasd)
func cmprtFgrs(number: Int)->Bool {
    var numString1 = String(number)
    var checkNum1: [Int] = []
    for i in numString1 {
        //checkNum1.append(i)
    }
    return true
}
//[ 도전 과제 ]
//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


import UIKit

//[ 과제 ]
//- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
func twoNumPlus(_ num1: Int,_ num2: Int)->Int{
    var check = num2
    var checkCount = 0
    var mixNum = 1
    while check > 0 {
        check = check / 10
        checkCount += 1
    }
    for i in 1...checkCount {
        mixNum = mixNum * 10
    }
    return (num2 + (num1 * mixNum))
}

print(twoNumPlus(29, 100))
//- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

var char = "a"
func checkString(_ duck1: String,_ duck2: String)->Bool{
    if duck1 == duck2 {
        return true
    } else {
        return false
    }
}

print(checkString("duck", "duck12"))
print("수한아 봐봐")
//print(int(char)!)
//func checkString(_ duck1: String,_ duck2: String)->Bool{
//    if duck1.count == duck2.count {
//        for i in 0...duck1.count {
//            if (Int(duck1[i])! != Int(duck2[i])!){
//                return false
//            }
//        }
//    }else {
//        return false
//    }
//    return true
//}
//- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func numCheck(_ number: [Int])->[Int]{
    var duck: [Int] = []
    duck.append(1)
    print(duck.count)
}
var duck: [Int] = [1,2]
//print(numCheck(duck[]))
//- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func threeFive(_ number: Int){
    
    for i in 1...number {
        if ( ((i % 3) == 0)&&((i % 5 ) == 0)){
            print(i)
        }
    }
}
//print(threeFive(10))
//[ 도전 과제 ]
//- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
//func checkDecimal(_ number: Int)->Bool{
//    var check: Int = number / 2
//    var checkPoint: Bool = true
//    if number == 2{
//        return true
//    }
//    for i in 2...(check+1) {
//        if ((number % i) == 0) {
//            checkPoint = false
//        }
//    }
//    if checkPoint == false{
//        return checkPoint
//    }
//    return true
//}
//print(checkDecimal(176))
//- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
//  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
//func fibonacci(_ number: Int)-> Int{
//    var result: Int = 0
//
//
//    var check: Int = 0      //head
//    var sum: Int = 0        //mid
//    var beforeSum: Int = 1  //rear
//    for i in 1...number {
//        sum = beforeSum + check
//        check = beforeSum
//        beforeSum = sum
//
//    }
//    return beforeSum
//}
//print(fibonacci(2))
//- 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
//  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
//  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
//      윤년X 예시 - 200, 300, 500, 600, 1900, 2100


