import UIKit

//변수와 상수
//변수 - 처음 값이 대입된 이후에 값이 변경 할 수 있다.
//상수 - 처음 값이 대입된 이후에 값을 변경할 수 없다.
//-> 변경 가능한 데이터인지 먼저 정할 것

//변수
//var로 선언
//타입 정보
//선언 생략 가능
//대입되는 값에서 추론
var i = 1
var f : Float = 1.1
i=3
//선언과 초기값
//변수 선언과 초기값 분리
//변수 선언과 초기값 대입 분리 가능
//분리 시 타입 선언 생략 불가
var intVar : Int
intVar = 10
//var duck      error

//타입선언과 자주 접하는 에러
//1.타입 정보가 있으면 선언 생략 가능
//2.타입 정보가 없으면 타입 선언 생략 불가
//3.변수의 타입과 대입 값의 타입이 다르면 에러 -> swift 타입에 대해 강력함
//4.서로 다른 타입 간 연산 에러
//타입 혼합 에러
//var var1 = 10 //int
//var1 = 3.14   //error

//타입 대입 에러
//var intVar1 = 1
//var floatVar1 = 1.2
//var sum = intVar + floatVar1


//상수
//변경 불가능
//let으로 선언
let constant = 123
//constant=456      //값 대입 불가

//변수/상수 사용 전 초기화
//자동 초기화 안됨
//초기화 전에 사용하면 에러
var a : Int
//a + 10            //초기화 전에 연선 불가

//산술연산자
//+,-,*,/
//산술 단항 연산자
//+,-   ex) -1
//증감 단항 연산자는 사용 불가
//++,--
//복합대입연산자
//+=,-=연산자 사용

//공백 문자와 연산자 주의
//산술 이항 연산자
//1 + 2 good
//1 +2 <-단항연산자이므로 에러
//연산자와 피연산자 사
//연산자와 피연산자 사이의 공백
//-i  음수로 바꾸는 단항 연산자
//- i 뺼셈을 위한 이항 연산자

//복합 대입 연산자
//대입(=) 연산자의 다른 연산자 결합
var num = 1
//곱하기 대입 연산자 : *=
num *= 2    // num <- 2
//더하기 대입 연산 : +=
num += 2    // num <- 4
//빼기 대입 연산자 : -=
num -= 2    // num <- 2
//나머지 대입 연산자 : %=
num %= 3    // num <- 2
//나누기 대입 연산자 : /=
num /= 2    // num <- 1

//비교, 3항 연산자
//비교 연산자
//==,!=
//<,>,>=,<=
//3항 연산자
//?(true expression) : (false expression)
//valuse = isTrue ? 10 : 20 //isTrue 갑싱 트로면 10 거짓이면 20

//범위 연산자
//단한(Closed) 범위
//1 ... 10 : 1에서 10까지, 10 포함
//반 닫힘(Half Closed) 범위
//1 ..< 10 : 9까지

//논리 연산자
//&& ,  || , ! : 괄호쓰면 편함

//nil 연산자
//nil-coalescing 연산자 : ??
//nil 관련된 연산자
//nil 을 다루븐 방법 - unwrapping
//?? 연산자는 nil이 아니면 unwrapping, nil이면 defaultValue
//value = optionalValue ?? defaultValue


//데이타 타입
//부울 : Bool <-true,false
//정수 : Int, UInt
//상수 : Float, Ddouble
//문자, 문자열 : Character, String

//부울형
//타입 선언 : Bool
//값 : true, false
var boolVar : Bool = true

//정수 터입
//정수형 타입
//Int
//UInt(Unsigned)

//크기에 따른 정수형 타입
//Int8, Int16, Int32, Int64( & Unsigned)

//정수형 타입 크기
//Int8 : -128 ~ 127
//UInt : 0 ~ 255

//Int 타입
//Int 타입 : 32비트 - Int32 , 64비트 - Int64

//값의 범위 : max ,min
//Int.max , Int.min

//타입 크기 에러
//타입 범위 벗어나면 에러
//Int8 : -128 ~ 127
var maxtest1 : Int8 = 127
//var maxtest2 : Int8 = 128     error

//타입 호환
//타입 혼합 사용 에러
//Int8Val + Int16Val

//타입 선언과 다른 타입의 값 대입 에러
//let int32Val : Int32 = Int8Val

//타입변환
//정수형 타입 변환
//Int16(Int8) = int16Val

//다른 타입의 값에서 변환
var i1 = Int(3.14)
var i2 = Int("1234")
var i3 = Int(false)
print(i3)
//타입 실패
let str = "hello"
Int(str)    //nil

//정수형 ㅏ입
//랜덤 함수
//func arc4random() -> UInt32
//func arc4random_uniform(_:UInt32) -> UInt32

//githun
