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
//func numCheck(_ number: [Int])->[Int]{
//    var duck: [Int] = []
//    duck.append(1)
//    print(duck.count)
//}
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


