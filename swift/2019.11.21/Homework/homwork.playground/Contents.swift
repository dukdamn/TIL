import UIKit

//[ 과제 - 알고리즘 ]
//1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

func sumNumber1(_ number: Int) -> Int {
    var sum = 0
    if number > 0 {
        for i in 1...number {
            sum += i
        }
    }else {
        for i in number...1 {
            sum += i
        }
    }
    return sum
}

sumNumber1(0)

//2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
func checkNum(_ number: Int)  -> [String] {
    var result: [String] = []
    for i in 1...number{
        if "\(i)".contains("3")||"\(i)".contains("6")||"\(i)".contains("9") {
            result.append("*")
        } else {
            result.append("\(i)")
        }
    }
    return result
}
checkNum(10)
//3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3

// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복
// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
func gcmRcm(_ num1:Int,_ num2: Int) -> [String:Int] {
    var gcm = 1
    let minNum = num1 > num2 ? num1 : num2
    for i in 1...minNum {
        if (num1 % i == 0) && (num2 % i == 0){
            if gcm < i {
                gcm = i
            }
        }
    }
    let result = ["gcm":gcm,"lcm":(num1 * num2) / gcm]
    
    return result
}


print(gcmRcm(20, 15))

print(gcmRcm(6, 9))
