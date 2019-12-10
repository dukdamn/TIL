//: [Previous](@previous)
//: - - -
//: # Strong, Unowned, Weak
//: - - -

class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
//  let teacher: Teacher
  unowned let teacher: Teacher      // 참조카운트 증가시키지 않음
//  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher()       // 할당카운트만 1 올라감
var student: Student? = Student(teacher: teacher!)
teacher?.student = student          // count 2 에서


print("\n---------- [ teacher release ] ----------\n")
teacher = nil       // 티쳐의 count 0 이되어 사라짐 student count 1

print("\n---------- [ student release ] ----------\n")
student = nil       //


// 내부의 있는걸 해결하고 밖을 해결함
// 처음부터 weak 와 unowned를 사용하여 강한순환 참조를 대비함


/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
 ***************************************************/


//: [Next](@next)
