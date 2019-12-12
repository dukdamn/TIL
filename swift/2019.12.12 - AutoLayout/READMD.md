# AutoLayout

뷰에 주어진 제약조건에 따라 뷰의 크기와 위치를 동적으로 계산해 배치하는 것

외부 또는 내부의 변화에 동적으로 반응하여 유저 인터페이스 구성

## 외적변화요소 (External Changes)

- 서로 다른 기기 및 스크린 기기
- 기기 회전
- iPad / iPhone+ 등에서 Split View 로 진입하거나 빠져나올 떄
- ...

## 내적 변화 요소 (Internal Changes)

- 앱에서 보여지는 컨텐츠의 변화
- 국제화 지원 (텍스트, 날짜와 숫자, RTL 등)
- Dynamic Type 지원 (글꼴 크기)
- ...



## Laying out a user interface

유저 인터페이스 구성을 위한 3가지 주요 접근 방식

- Frame 기반의 프로그래밍 방식
- Autoresizing masks
- Auto Layout

## Frame-Based Layout

![스크린샷 2019-12-12 오후 1.20.53](https://tva1.sinaimg.cn/large/006tNbRwgy1g9ttlhapiij30u013cn05.jpg)



### 프레임기반의 프로그래밍 방식

- 원점의 위치와 크기를 통해 그릴 영역 계산
- 가장 유연하며 빠르게 구현 가능
- 모든 뷰에 대해 개별적인 설정과 관리
- 동적인 변화에 대한 설계 및 디버그, 유지 관리에 많은 노력이 필요





## Auto Layout

![스크린샷 2019-12-12 오후 1.34.56](https://tva1.sinaimg.cn/large/006tNbRwgy1g9tu01ybuzj30u012ngob.jpg)

### 오토레이아웃 방식

- 제약 조건을 이용해 유저 인터페이스 정의
- 뷰간의 관계 설정을 통한 크기와 위치 계산
- 내/외부 변경 사항에 동적으로 반응
- Frame 기반에 비해 느린 성능





## Control-Dragging Constraints

![스크린샷 2019-12-12 오후 1.37.48](https://tva1.sinaimg.cn/large/006tNbRwgy1g9tu335tdcj31s00u04ci.jpg)



top방향으로 제약을 두겠다

Aspect Ratio 비율을 이용하여 설정



## Auto Layout tools

![스크린샷 2019-12-12 오후 1.38.45](https://tva1.sinaimg.cn/large/006tNbRwgy1g9tu458u14j31o50u047b.jpg)



## Auto Layout Attributes

![스크린샷 2019-12-12 오후 1.55.51](https://tva1.sinaimg.cn/large/006tNbRwgy1g9tulu6cfdj30yr0u0wmt.jpg)





## Anatomy of a Constraint



![스크린샷 2019-12-12 오후 1.56.25](https://tva1.sinaimg.cn/large/006tNbRwgy1g9tumgazsgj31pm0u0gtc.jpg)



스토리보드 상에서만 확인 가능하는것

인스톨드 남겨눈두는데 실행은 되지 않음





frame으로 위치 잡을 때 SafeArea



```swift
view.safeAreainsets.top //44

UIApplication.shared.statusBVBarFrame.size.height + 20



viewDidLoad() // print(view.safeAreainsets.top) 0,0,0,0
view.SafeAreaInsetsDidchange()
print(view.safeAreainsets.top) // 값 나옴
```





# Autolayout Anchors

## Horizontal Layout Anchors

view의 수평선, x축에 관련된 제약조건

NSLayoutXAxisAnchor 클래스의 객체

Leading anchor 

Trailing anchor 

Left anchor 

Right anchor 

Center-X anchor





activateLayoutAnchors

view.topAnchor - 뷰에 설정 시

view.safeAreaLayoutGuide.topAnchor - SafeArea에 설정 시

translatesAutoresizingMaskIntoConstraints // false 비활성화 시켜야댐

제약조건을 비활성화 시키고 내 설정에 맞게 제약조건 설정



