# Memory Management without ARC

## GC (Garbage Collection)

- 정기적으로 Garbage Collector 가 동작하여 더이상 사용되지 않는 메모리를 반환하는 방식
- OS X 에서만 지원했었으나 버전 10.8 (Mountain Lion) 부터 deprecated



## MRR()



## ARC(Automatic Reference Counting)

RC 자동 관리 방식

컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입

GC 처럼 런타임이 아닌 컴파일 단에서 처리 (Heap 에 대한 스캔 불필요 /  앱 일시 정지 현상 없음)

메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함

![스크린샷 2019-12-09 오후 1.36.07](https://tva1.sinaimg.cn/large/006tNbRwgy1g9qd6stsvdj31as0t8x2e.jpg)



ARC는 클래스의 인스턴스에만 적용 (Class - Reference 타입, Struct /Enum - Value 타입)

활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않음

참조 타입

- 강한 참조 (Strong) : 기본값, 참조될 떄 마다 참조 카운트 1 증가
- 약한 참조 (Weak). 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않음

강한 순한 참조 (Strong Reference Cycles) 에 대한 주의 필요

![스크린샷 2019-12-09 오후 1.39.38](https://tva1.sinaimg.cn/large/006tNbRwgy1g9qda22dtij31aq0m64an.jpg)





## Strong Reference Cycle

- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화 된 참조 카운트가 남아있어 메모리 누수가 발생하는 현상
- 앱의 실행이 느려지거나 오동작 또는 오류를 발생시키는 원인이 됨



## Memory Management Is Hard

- Lots of rules and conventions
- High hurdles for new developers
- Constant attention for existing developers
- Requires perfection









## ARC Basic

```swift
/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1")   // count 1
obj1 = nil      // count 0


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2")   // count 1
var countUp = obj2      // count 2


obj2 = nil          // count 1
countUp = nil       // count 0
countUp = nil

/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3")   // count 1
var array = [obj3, obj3]        // count 3

obj3 = nil
array.remove(at: 0)         // count 1
array.remove(at: 0)         // count 0  


/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */

```



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

