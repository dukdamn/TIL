import UIKit


//- 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
func Introduce(age: Int, name: String)->(){
    print("저의 이름은 \(name) 나이는 \(age) 입니다")
}
Introduce(age: 29, name: "황정덕")


//- 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func mulTwo(number: Int)->Bool{
    if ((number % 2)==0){
        return true
    }else{
        return false
    }
}
print(mulTwo(number: 4))


//- 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func mulNum(number1: Int,number2: Int = 10)->Int{
    return number1 * number2
}
print(mulNum(number1: 4,number2: 4),4)


//- 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func avg4Score(_ scores: Double...)->Double{
    var total = 0.0
    for score in scores {
        total += score
    }
    return total / Double(scores.count)
}
print(avg4Score(1,2,3,4,5))


//- 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func checkScore(_ score: Int)->Character{
    if ((score < 101)&&(score >= 90)){
        return "A"
    }else if ((score < 90)&&(score >= 80)){
        return "B"
    }else if ((score < 80)&&(score >= 70)){
        return "C"
    }else if ((score < 70)&&(score >= 0)){
        return "F"
    }else{
        print("점수 범위를 벗어났 습니다.")
        return "E"
    }
}
print(checkScore(80))


//- 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func avgScore(_ scores: Double...)->Character{
    var total = 0.0
    for score in scores {
        total += score
    }
    let avgScore = (total / Double(scores.count))
    if ((avgScore < 101)&&(avgScore >= 90)){
        return "A"
    }else if ((avgScore < 90)&&(avgScore >= 80)){
        return "B"
    }else if ((avgScore < 80)&&(avgScore >= 70)){
        return "C"
    }else if ((avgScore < 70)&&(avgScore >= 0)){
        return "F"
    }else{
        print("점수 범위를 벗어났 습니다.")
        return "E"
    }
}
print(avgScore(90,80,70,60,100,100))
