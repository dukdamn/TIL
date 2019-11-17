#playground 


show row Markup
show Rendered Markup

print		
디버그 영역에 원하는 정보를 출력하기 위한 함수(Free Function)		
	
```swift
print(3.14)

```

원하는 위치까지만 실행하기
쉬프트 엔터

전체 실행
쉐프트 커멘트 엔터

#Comment
##Quick Help Markup

*주석*		
1.빠르게 특정 부분의 코드를 비활성화		
2.협업 또는 인계 시 이해를 돕기 위해			
3.자기 자신을 위해		
4.문서화. 
- 주석 없이도 쉽게 이해할 수 있을 만한 코드를 찍는게 좋다.


@Semicolon (;)		
각 라인의 마지막에 붙는 세미콜론은  옵션
한 라인에 여러 구문(다중 명령) 을 사용하고 싶을경우는 세미콜론 필수
ex) print(1); print(2);			



#변수 상수

상수오 변수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고있는 컨테이너		
상수 한번 성정되면 값 변결 불가
변수 설정한 값을 변경 가능
let maxim = 10
// maxim 20 error

변수 선언시
1. 네이밍 확인 (의미, 방식, 길이 등)
2. 네이밍 컨벤션
3. 선언순서


#Namng
영어 외에도 유니코드 문자를 포함한 대부분의 문자를 사용해 네이밍 가능		
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)

###변수를 사용할 수 없는 이름
1. 같은 스코프 범위 내에서 중복되는 이름
2. 공백문자
3. 수학기호
4. 화살표
5. 숫자로 시작하는 이름 (시작부분 외에는 사용가능

// e.g.
// let 한글 = "ㄱ"
// let 공 백 = "X"
// let √ = "root"
// let → = "arrow"
// let 369게임 = "12짝45짝..."

#Type Annotation
타입 지정
변수 선언 시 사용될 자료의 타입을 명확하게 지어하는 것
let year: Int = 2019
var day: Int = 20


#Type Inference
타입 추론
변수 선언 시 초기화로 사용되는 값의 타입을 종해 변수의 타입을 추론하여 적용하는것		

```swift
let year = 2019
var day = 20
```

타입확인
type(of: )

#Literals & Types
리터럴
소스코드에서 고정된 값으로 표현되는 문자(데이터) 그자체
정수/실수/문자/문자열/불리언 리터럴 등

#Lumeric Literals
```swift
var signedInteger = 123		//123 <- 리터럴
signedInteger = +123
signedInteger = -123
type(of: signedInteger)

let decimalInteger = 17
let binaryInteger = 0b10001	// 2진수
type(of: binaryInteger)

let octalInteger = 0o21			// 8진수
let hexadecimalInteger = 0x11	//16진수

var bigNumber = 1_000_000_000		// _ 정해진 위치가 있지 않음
bigNumber = 000_001_000_000_000		// ex) 100,000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF
```

#Integer Types

8-bit : Int8, UInt8
16-bit : Int16, UInt16
32-bit : Int32, UInt32
64-bit : Int64, UInt64
Platform dependent : Int, UInt (64-bit on modern devices)		
-크기에 따른 범위 확인하자~~~			
기본 Int 타입의 크기?		
Int64, 64bit 

```swift
var integer = 123
integer = -123
type(of: integer)

var unsignedInteger: UInt = 123
type(of: unsignedInteger)

//MemoryLayout<타입> <- 크기 확인
MemoryLayout<Int>.size		//8 * 8 = 6 bit
Int.max						// 2^63 -1
Int.min						// -2^63

MemoryLayout<UInt64>.size
UInt64.max   // Playground Bug
UInt64.min
print(UInt64.max)   // 18,446,744,073,709,551,615
```

#Question
UInt에 음수를 넣으면?		
Int8 에 127 을 초과하는 숫자를 넣으면?		
Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?		
옛날 기기의 cpu의 기기에 연산 비트가 낮으면 오버플로우가 일어 날수 있다.
```swift
//let q1: UInt8 = -1

//let q2: Int8 = Int8.max + 1
//let q2: Int8 = 127 + 1
//실행전 오류 - 커파일 에러
//let q2 = Int8(127 + 1)
//실행 도중 오류 - 런타임 에러

//Int32.max
//Int64.max

//let q3 = Int(Int32.max) + 1
//Int32.max + 1
//Int64.max + 1
```


#Overflow Operators
아래의 각 연산 확인!!!		
int의 부호비트의 경우 맨 끝에 지정한다				
max값을 가질떄 1을 더할경우 원래는 오버플로우 나지만 오버플로우 연산으로 1더할 경우 부호비트 가 바뀌어 진다		
// Overflow addition
//var add: Int8 = Int8.max + 1
var add: Int8 = Int8.max &+ 1

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1


// 01111111
// 10000000


// Overflow subtraction
//var subtract: Int8 = Int8.min - 1
var subtract: Int8 = Int8.min &- 1

Int8.min &- 1
Int32.min &- 1
Int64.min &- 1

// 10000000
// 01111111


// Overflow multiplication
//var multiplication: Int8 = Int8.max * 2
var multiplication: Int8 = Int8.max &* 2

Int8.max &* 2
Int32.max &* 2
Int64.max &* 2


#Floating-point Literal
```swift
var floatingPoint = 1.23
floatingPoint = 1.23e4
floatingPoint = 0xFp3
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23
type(of: floatValue)

MemoryLayout<Float>.size
Float.greatestFiniteMagnitude   // FLT_MAX
Float.leastNormalMagnitude   // FLT_MIN

MemoryLayout<Double>.size
Double.greatestFiniteMagnitude   // DBL_MAX
Double.leastNormalMagnitude   // DBL_MIN
```

Double - 최소 소수점 이하 15 자리수 이하의 정밀도	
Float - 최소 소수점 이하 6 자리수 이하의 정밀도		
부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음

swift typesafty 언어
#Boolean Literal
```swift
var isBool = true
type(of: isBool)

isBool = false
//isBool = False
//isBool = 1
//isBool = 0
```

#String Literal
```swift
let str = "Hello, world!"
type(of: str)

let str1 = ""
type(of: str1)

var language: String = "Swift"
```


#Character Literal
```swift
var nonCharacter = "C"
type(of: nonCharacter)

var character: Character = "C"
type(of: character)

MemoryLayout<String>.size
MemoryLayout<Character>.size


//character = ' '		//swift언어에서는 지원하지 않는다
//character = ""
//character = "string"


let whiteSpace = " "
type(of: whiteSpace)
```


#Typealias
문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용		

```swift
```


#Type Conversion
```swift
let height = Int8(5)
let width = 10			//int
//let area = height * width
//print(area)


let h = Int8(12)
//let x = 10 * h			//타입추론
//print(x)

```
#Question
8번째 라인 let area = height * width  부분은 에러가 발생하고
13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?


```swift
let num = 10
let floatNum = Float(num)
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)


let anInteger: Int = -15			//abs확인 ㄲ
let absNum = abs(anInteger)
type(of: absNum)
```


#Basic Operators
중요~

#Terminology
단항 연산자		
전위 표기법		
후위 표기법		
이항 연산자		
중위 표기법		
삼항 연산자			
	
```swift			
let a = 123
let b = 456
let c: Int? = 789

// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "zero or negative"
ㄹ
//if a > 0 {
//  "positive"
//} else {
//  "negative"
//}		

```


#Assignment Operators
할당연산

```swift
// Basic assignment operator
var value = 0

// Addition assignment operator
value = value + 10

// Subraction assignment operator
value = value - 5

// Multiplication assignment operator
value = value * 2

// Division assignment operator
value = value / 2

// Modulo assignment operator
value = value % 2

//줄여 쓰기 위하여
// Compound assignment Operators
value += 10
// <- value = value + 10
value -= 5
value *= 2
value /= 2
value %= 2

// c언어 등등은 지원
// 미지원 : value++ , value--

//value++
//value += 1
//value = value + 1

//튜플 보통 7미만으로 사용
var (x, y) = (1, 2)
print(x, y)
```
#Arithmetic Operators
산술연산

```swift
// Unary plus opertor
+a

// Addition Operator
a + b

"Hello, " + "world"

// Unary minus Operator
-a

// Subtraction Operator
a - b

// Multiplication Operator
a * b

// Division Operator
b / a

// Modulo operator
b % a


// 실수에서의 나눗셈
let e = 123.4
let f = 5.678

e / f
//e % f

// 나머지 구하기 1 (반올림)
e.remainder(dividingBy: f)

// 나머지 구하기 2 (내림)
e.truncatingRemainder(dividingBy: f)


// 나머지 구하기 2 의 계산 방법
let quotient = (e / f).rounded(.towardZero)
let remainder = e.truncatingRemainder(dividingBy: f)
let sum = f * quotient + remainder

```


#Question
숫자가 아닌 문자열에 대한 비교는?
아스키코드 유니코드로 비교~		

"iOS" > "Apple"		
"Application" > "Steve Jobs"		

"Swift5" <= "Swift4"		
"Playground" == "Playground"


#Logical Operators
논리 연산자

```swift
func returnTrue() -> Bool {
  print("function called")
  return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?
// 우선순위 : && > ||

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue()

print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue()

print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()

```

#Range Operators
범위 연산


```swift
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0,1,2,3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...]
names[...2]
names[..<2]
```

#Question

```swift
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

for index in stride(from: 5, through: 1, by: -1) {
  print("\(index) times 5 is \(index * 5)")
}
print()


// 함수를 쓰지 않고 역순 구하는 방법

let range = 1...5
type(of: range)
range.lowerBound
range.upperBound

for index in range {
  let num = range.upperBound - index + range.lowerBound
  print("\(num) times 5 is \(num * 5)")
}
```

#Function
Input 과 Output 이 모두 있는 것 (Function)	 
Input 이 없고 Output 만 있는 것 (Generator)	 
Input 이 있고 Output 은 없는 것 (Consumer)	 
Input 과 Output 이 모두 없는 것		



```swift
func <#functionName#>(<#parameterName#>: <#Type#>) -> <#ReturnType#> {
   <#statements#>
 }
```

-함수내에서 어울리는 단

아뮤먼트 네임과 파라매타 내임 구분짓는 이유

```swift
func 함수이름 (전달인자 레이블 매개변수... ) -> 반환타입 {
	실행구만
	return 반환 값
}

func arithmeticAverage(_ numbers: Double...)-> Double{
	var total =0.0
	for number in numvers {
		total += 1
	}
	return total / Double(numbers.count)
}
```