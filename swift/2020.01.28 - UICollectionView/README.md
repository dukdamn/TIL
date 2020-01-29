# UICollectionView

정렬된 자료들을 사용자가 원하는 혁식에 맞게 유연하게 표현할 수 있는 객체

![스크린샷 2020-01-28 오후 1.11.07](https://tva1.sinaimg.cn/large/006tNbRwgy1gbc5g7pe88j31f10u0u0x.jpg)

## Merging Content and Layout

뷰를 배치를 어떻게 할것인지

![스크린샷 2020-01-28 오후 1.13.10](https://tva1.sinaimg.cn/large/006tNbRwgy1gbc5hy1675j310o0u0n8a.jpg)



## The classes / protocols for collection views

![스크린샷 2020-01-28 오후 1.13.43](https://tva1.sinaimg.cn/large/006tNbRwgy1gbc5ihnjesj30u00vsam6.jpg)



## Three types of visual elements

### 셀 (Cell)

- 컬렉션 뷰의 단일 데이터 항목을 표현하는 객체이며, 레이아웃에 의해 배치되는 주요 요소
- 각 셀은 다중 섹션으로 나누거나 하나의 그룹으로만 묶어 표현할 수 있음
- 컬렉션 뷰의 컨텐츠 영역에 셀들을 배열하는 것이 레이아웃 객체의 주 업무

### 보조(보충) 뷰 (Supplementary views)

- 섹션 또는 컬렉션 뷰 자체에 대한 헤더와 푸터 같은 역할을 하는 뷰
- 셀처럼 데이터를 표현할 수 있는 것은 같지만, 유저가 선택할 수 없는 뷰
- 선택 사항(Optional)이며, 높이를 0으로 설정하면 미생성

### 정식 뷰(Decoration views)

- 컬렉션 뷰의 배경을 꾸미는 데 사용하는 시각적 장식용 뷰
- 선택사항이며, 유저가 선택할 수 없고 레이아웃 객체를 통해 정의

## Section Layout

Cell Spacing 셀과의 거리

Line Spacing 위아래의 거리

Section Inset 전체 테두리 



