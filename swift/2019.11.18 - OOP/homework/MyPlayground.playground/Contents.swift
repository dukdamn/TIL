import UIKit

class Car {
    var model: String
    var color: String
    var modeYear: Int
    init() {
        self.color = ""
        self.model = ""
        self.modeYear = 0
    }
    
    init(model: String,color: String,modelYear: Int) {
        self.model = model
        self.color = color
        self.modeYear = modelYear
    }
    func dirive(){
        
    }
    func reverse(){
        
    }
}
struct Car1 {
    var model: String = ""
    var color: String = ""
    
    init(model: String,color: String) {
        self.model = model
        self.color = color
    }
}
var suk = Car(model: "밴틀리",color: "금색",modelYear: 2019)
var duk = suk
suk.color = "황금"
print(duk.color)
print(suk)
print(duk)
//duk == suk
var kim = Car1(model: "티코",color: "똥색")
var hong = kim
print(kim)
print(hong)



/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

class Rectangle {
    private var width: Int
    var height: Int
    init(width: Int,height: Int) {
        self.width = width
        self.height = height
    }
    func setWidth( width: Int){
        self.width = width
    }
    func setHeight(height: Int) {
        self.height = height
    }
    func getWidth()->Int {
        return self.width
    }
    func getHeight()->Int{
        return self.height
    }
    // Stored + Computed get(read), set(write)
    func getArea() -> Int {
        return (self.height * self.width)
    }
  
}

var deok = Rectangle(width: 10,height: 5)
var seok = Rectangle(width: 7,height: 7)
deok.setHeight(height: <#T##Int#>)

/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 */

class TV {
    var impormation: String
    var volume: Int
    var power: Bool
    init(impormation: String, volume: Int,power: Bool) {
        self.impormation = impormation
        self.volume = volume
        self.power = power
    }
}



/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

class Square {
}


class Circle {
}



//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//   구현 내용은 자유롭게
//
// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기
//
// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기
//
// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송
// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지
//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
// ex)
// let calculator = Calculator() // 객체생성
//
// calculator.value  // 0
// calculator.add(10)    // 10
// calculator.add(5)     // 15
//
// calculator.subtract(9)  // 6
// calculator.subtract(10) // -4
//
// calculator.multiply(4)   // -16
// calculator.multiply(-10) // 160
//
// calculator.divide(10)   // 16
// calculator.reset()      // 0
//3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기



struct CoordinatePoint {
    var x: Int
    var y: Int
}
