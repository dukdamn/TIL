# Intrinsic Content Size

고유의 콘텐츠 크기 (컨텐츠를 잘라내거나 줄이지 않고도 온전히 표현할 수 있는 최소한의 공간)

뷰에 따라 다른 형태를 가질 수 있음

레이아웃 작업 시 사이즈를 통해 제약 조건을 자동 생성하여 적용



![스크린샷 2019-12-16 오후 1.17.34](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yfza57gcj32bg0p0gp9.jpg)



오토레이아웃의 경우 프레임과 달리 좌표원점(위치)은 지정되있지 않지만 크기를 직접지정해 주거나 

레이블의경우 뷰처럼 4가지를 안해줘도 폰트의 크기값으로 크기를 정해줘서 사이즈의 크기 지정되있다 



버튼의 경우 레이블과 같다

UIImage뷰의 경우 2가지의 경우가 있다 . 이미지가 있을떄와 없을때가 있다. 

이미지가 없을때 뷰와같이 4가지 조건을 지켜줘야 되지만

이미지가 삽입되있을 떄는 라벨 버튼과 같이 2가지 조건만 마추면된다.

## CHCR

Intrinsic Size 의 값을 기준으로 

- Content Hugging : 더 이상 늘어나지 못하도록 최대 크기에 제한
- Content Compression Resistance : 더 이상 줄어들지 못하도록 최소 크기에 제한



![스크린샷 2019-12-16 오후 1.37.26](https://tva1.sinaimg.cn/large/006tNbRwgy1g9ygjvvze1j31r80n240j.jpg)



![스크린샷 2019-12-16 오후 1.37.45](https://tva1.sinaimg.cn/large/006tNbRwgy1g9ygkczc6rj32bm0t67wi.jpg)



## Priority 제약조건

각각의 제약 조건은 1~1000 사이의 우선 순위를 가짐

Required (1000), High (750), Low (250)

상충되는 제약조건이 적용되어 있다면 우선순위가 높은 것으로 적용

## Programmatically

```swift

// set
view.setContentHuggingPriority(.defaultHigh, for: .horizontal) view.setContentCompressionResistancePriority(.required, for: .vertical)

// get
view.contentHuggingPriority(for: .horizontal) view.contentCompressionResistancePriority(for: .vertical)
```





# UIStackView

행이나 열로 이루어진 뷰의 집합을 쉽게 배치할 수 있도록 제공되는 컨테이너뷰

여러 개의 뷰에 대한 오토레이아웃 제약조건을 각각 다루기보다 하나의 뷰로 합쳐서 관리

arrangedSubviews 프로퍼티를 통해 서브뷰들을 관리

레이아웃은 축(axis), 분배(distribution), 정렬(alignment), 간격(spacing)등의 요소에 의해 결정

## Axis / Alignment / Distribution / Spacing

가로축인지 세로축인지

정렬

내가 선택한 크기와 간격 조절 



![스크린샷 2019-12-16 오후 4.07.20](https://tva1.sinaimg.cn/large/006tNbRwgy1g9ykvvky7kj318o0u00vt.jpg)



## Alignment - Horizontal StackView

세로방향으로 가득체우는것

탑을 기준으로 정렬함

탑의 반대

센터를 기준으로 

레이블을 기준으로 처음기준으로

마지막을 기준으로

![스크린샷 2019-12-16 오후 4.09.14](https://tva1.sinaimg.cn/large/006tNbRwgy1g9ykxuds3kj31s80u011l.jpg)



## Distribution - Horizontal StackView

Fill - 사이즈로 하거나 각각의 우선순위를 기준으로 각각의 크기를 조절\

CHCR 을 기준을 둔다

FiullEqually - 뷰 내부의 크기를 다 같게 만든다.

FillProportionally - 각각 크기의 비율로 나누어 스택의 전체크기를 비율로 나누어 그 비율에 맞게 각각에 크기를 줌

EqualSpacing - 간격을 같게 만들어 준다

EqualCentering - 뷰의 중간지점을 기준을 다 같게 하여 만든다.



![스크린샷 2019-12-16 오후 4.14.16](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yl3328cpj31pv0u0gqy.jpg)



## StackView Size = Contents Size

내부 크기들의 합

세로방향의 가장 큰 뷰의 기준으로 높이가 결정됨

![스크린샷 2019-12-16 오후 4.15.39](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yl4i7t53j31ds0u0gpf.jpg)



## Programmatically

스택뷰가 유아이뷰의 서브뷰 



![스크린샷 2019-12-16 오후 4.17.51](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yl6soqexj32c20t678a.jpg)



코드로 스택뷰를 할떄 

![스크린샷 2019-12-16 오후 4.18.35](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yl7k6vb5j31vy0u0wmd.jpg)