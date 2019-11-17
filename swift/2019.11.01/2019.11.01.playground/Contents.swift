import UIKit

//1) var 와 let의 차이점에 대해 서술하고 그 예제 코드 작성
//var : 변수를 만들때 사용
//      프로그램이 실행되는 동안 값을 언제든지 변경가능
//let : 상수를 만들때 사용
//      프로그램이 실행되는 동안 변하지 않고 고정적인 값

//VarNum=0
var num1 : Int = 0
let num2 : Int = 0
var name1 : String = "철수"
let name2 : String = "영희"

num1 = 4
//num = 5 error
name1 = "정덕"
//name2 = "수훈" error



//2) 반복문(Loop)의 종류와 1~10까지 출력하는 코드 작성
//1.for~in 구문
for i in 1 ... 10{
    print(i)
}
//2.while 구문
var n = 1
while n < 11{
    print(n)
    n = n + 1
}



//3.repeat~while 구문
n = 1
repeat {
    print(n)
    n = n+1
} while n < 11



//3) 타입 추론(Type Inference)이란?
//변수나 상수를 생성시 데이터 타입을 생략하면, 스위프트 컴파일러가 변수의 값을 확인하고 값에 맞는 타입을 추론하여 타입을 자동 지정
var age : Int = 30           //int타입 정리
var age1 = 30                //변수값 30을 보고 int 타입으로 추론
let name3 : String = "철수"   //String타입 정리
let name4 = "철수"            //변수값 문자 보고 String 타입으로 추론




//4) 논리연산자(Boolean Logic) 인 AND(&&) 와 OR(||) 로 나올 수 있는 경우의 수 4가지
//AND(&&)연산자 모두가 true이면 true, 둘 중 하나라도 false면 false반환
print(true && true)     //true
print(true && false)    //false
print(false && true)    //false
print(false && false)   //false

//OR(||)연산자 하나라도 true면 true, 둘 다 false면 false반환
print(true || true)     //true
print(true || false)    //true
print(false || true)    //true
print(false || false)   //false
