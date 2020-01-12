# ARC

Mamory Management의 한 방식입니다.

ARC 외의 다른 메모리 관리 방식에는 GC(Garbage Collection)과 MRR(Manual Retain-Release)/MRC(manual Reference Counting) 등이 있습니다.



1. GC (Garbage Collection)
   1. 정기적으로 Garbage Collector 가 동작하여 더이상 사용되지 않는 메모리를 반환하는 방식 • OS X 에서만 지원했었으나 버전 10.8 (Mountain Lion) 부터 deprecated



2. MRR (Manual Retain-Release) / MRC (Manual Referece Counting)
   1. RC(Reference Counting) 를 통해 메모리를 수동으로 관리하는 방식 
   2. retain / release / autorelease 등의 메모리 관리 코드를 직접 호출 
   3. 개발자가 명시적으로 RC 를 증가시키고 감소시키는 작업 수행

---

## MRR

- RC에 대한 이해가 필요합니다.
- Objective-C 에서는 ARC를 해제하고 MRR을 사용할 수도 있습니다.
- Objective-C에서는 이런 방식으로 alloc init 메서드 이외에도 retain과  release 메서드를 통해 참조 카운팅을 증가/감소시키며 직접 참조 카운트를 관리해주어야했습니다.

```objective-c
int main(int argc, const char * argv[]) {
  Person *man = [[Person alloc] init];
  [man doSomething]; 
  [man retain]; 
  [man doSomething]; 
  
  // [man release];
  [man doSomething]; 
  [man release]; 
  [man release]; 
  return 0; 
}
 
```

- 이처럼 직접 참조 카운트를 관리해주는 방식에는 신경써야할 부분이 많았습니다. 
- alloc, retain이 많을 경우에는 Memory Leak이 발생합니다.
- 반대로 release가 많을 경우 Dangling Pointer(허상, 고아)가 발생합니다.
- ![스크린샷 2019-12-09 오후 1.32.21](https://tva1.sinaimg.cn/large/006tNbRwgy1g9qd2k5ltxj30sv0dx0wg.jpg)

- 때문에 이런 메모리 관리를 자동으로 해주는 ARC가 등장하게 되었습니다.

---

## ARC

- RC 자동 관리 방식 (WWDC 2011 발표) 
- 컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입합니다.
- GC 처럼 런타임이 아닌 컴파일 단에서 처리합니다. (Heap 에 대한 스캔 불필요 / 앱 일시 정지 현상 없음) 
- 메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 해줍니다.

![스크린샷 2019-12-09 오후 1.35.22](https://tva1.sinaimg.cn/large/006tNbRwgy1g9qd5otfumj30m60dz459.jpg)

(ARC의 도입에 따라 생산성이 증가되었습니다.)

- ARC 는 클래스의 인스턴스에만 적용됩니다. (Class - Reference 타입 , Struct / Enum - Value 타입) 

- 활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않습니다.

- 참조 타입 

  ​	강한 참조 (Strong) : 기본값. 참조될 때마다 참조 카운트 1 증가 

  ​	약한 참조 (Weak), 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않습니다. 

  

  ARC는 강한 순환 참조 (Strong Reference Cycles) 에 대한 주의가 필요합니다.

  ![스크린샷 2019-12-09 오후 1.38.42](https://tva1.sinaimg.cn/large/006tNbRwgy1g9qd95o1wzj30my0aymzz.jpg)

---

Strong Reference Cycle(강한 참조 순환)

- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화된 참조 카운d

---

---

ARC Basic

1. Allocation & Release

```swift
class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}

var obj1: Person? = Person(testCase: "case1")
obj1 = nil
```

메모리에 할당하고, 해제하는 예제입니다. var obj1: Person? = Person(textCase: "casel")에서 레퍼런스 카운트가 1이 되고, 메모리에 할당됩니다. 그 다음 obj1 = nil을 통해 레퍼런스 카운트를 1 감소시켜서 0으로 만들게 되면, 메모리에서 해제됩니다.

2. 참조 카운트 증가

```swift
var obj2: Person? = Person(testCase: "case2") //ref count 1
var countUp = obj2 // count 2


obj2 = nil // count 1

countUp = nil // 0
```

3. Collection 에 의한 참조 카운트

```swift
var obj3: Person? = Person(testCase: "case3") //count 1
var array = [obj3, obj3] //count 3

obj3 = nil //count 2

array.remove(at: 0) // count 1
array.remove(at: 0) //count 0. deinit
```

- ref count는 배열에 넣어질 때마다 증가됩니다.

4. 강한 참조, 약한 참조
   1. strong : 기본값. 강한 참조. Reference Count 1 증가
   2. unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
   3. weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경

```swift
var strongObj4 = Person(testCase: "case4") //count 1
print(strongObj4) //strong reference이기 때문에 프린트가 됩니다.
---------------------------------------------

weak var weakObj4 = Person(testCase: "case4") //count 1이 되자마자 다시 해제되어 count가 0이 됩니다. 약한 참조는 레퍼런스 카운트를 증가시키지 않기 때문입니다.
print(weakObj4) //nil

---------------------------------------------unowned var unownedObj4 = Person(testCase: "case4") //
print(unownedObj4)
```

```swift
unowned let unownedLet = strongObj4 //사용 됨
unowned var unownedVar = strongObj4 // 사용 됨
//weak let weakLet = strongObj4 // error. 메모리가 해제되면 nil값이 할당되어야하는데, let으로 선언하면 값을 변경할 수 없기 때문에 let으로는 사용할 수 없습니다.
weak var weakVar = strongObj4 //사용할 수 있습니다.
```

---

## Scope

- 스코프 범위에 의한 할당 및 해제

```swift
class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty() //count 1.
  
  func allocateInstance() {
    let local = LocalScope()
    local.doSomething()
  }
  
  deinit {
    print("Application is being deinitialized")
  }
}


// Q. 아래의 코드 실행 시 출력되는 메시지는?

var app: Application? = Application() //count 1 -> ClassProperty Cont 1
app?.prop.doSomething()
app?.allocateInstance()



// Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?
app = nil

```

---

## Strong Reference Cycles

```swift
class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}
//Person은 Dog를 참조하고, Dog에서는 Person을 참조하는 형상입니다.

var giftbot: Person! = Person() //count 1
var tory: Dog! = Dog() //count 1

giftbot?.pet = tory //dog count 2
tory?.owner = giftbot //person count 2

giftbot.doSomething()
tory.doSomething()

#1
//이때 메모리에서 할당을 해제하기 위해 giftbot과 tory에 nil을 넣어봅시다.
giftbot.pet = nil //person count 1
tory.owner = nil //dog count 1
//이러면 메모리 할당이 해제됐을까요? 아닙니다. 서로가 강한 참조를 하고 있었기 떄문에

```

이때 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?

```swift
// #1상황으로 돌아가서 아래처럼 작성하면 됩니다. 순서에 주의해주세요. 

giftbot?.pet = nil
tory?.owner = nil

giftbot = nil
tory = nil
```

---

## Strong, Unowned, Weak



```swift
class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
  let teacher: Teacher
//  unowned let teacher: Teacher
//  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher() //count 1
var student: Student? = Student(teacher: teacher!) //student count 1
teacher?.student = student //student count 2


print("\n---------- [ teacher release ] ----------\n")
teacher = nil //count 0, student count 1

print("\n---------- [ student release ] ----------\n")
student = nil //count 0, student count 0
```

1) strong : 명시적으로 nil 대입 필요. teacher?.student = nil

 2) unowned : 자동으로 deinit. 	nil 처리 된 속성에 접근하면 런타임 에러 발생

 3) weak  : 자동으로 deinit. 	nil 처리 된 속성에 접근하면 nil 반환

---



# Comparing Structures and Classes

## 클래스와 구조체의 공통점

 \- 값을 저장하기 위한 프로퍼티

 \- 기능을 제공하기 위한 메서드

 \- 초기 상태를 설정하기 위한 생성자

 \- 기본 구현에서 기능을 추가하기 위한 확장(Extension)

 \- 특정 값에 접근할 수 있는 첨자(Subscript)

 \- 특정한 기능을 수행하기 위한 프로토콜 채택

 \- Upper Camel Case 사용

## 클래스만 제공하는 기능

 \- 상속 (Inheritance)

 \- 소멸자 (Deinitializer)

 \- 참조 카운트 (Reference counting)

## 값 타입 vs 참조 타입

```swift
class Dog {
  var name = "토리"
}
struct Cat {
  var name = "릴리"
}

let dog = Dog()
let cat = Cat()

//dog.name = "릴리"
//cat.name = "토리"

print(dog)
print(cat)
```

