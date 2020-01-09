# UIGestureRecognizer

핸드폰에서 동작하는 방법 

interupt를 통하여 동작

## GestureRecognizer Type

![스크린샷 2020-01-07 오후 1.11.40](https://tva1.sinaimg.cn/large/006tNbRwgy1ganvg3a1igj31ya0tih03.jpg)



 **탭** **- Tap** 

**●** 확대/축소 - Pinch 회전 Rotation**특정방향으로 밀기** **- Swipe** **●** **드래깅** **- Pan** **●** **오래 누르기** **- LongPress** **●** **화면 모서리 드래깅** **- ScreenEdgePan**



## Code

```swift
override func viewDidLoad() {
 super.viewDidLoad()
 let tapGesture = UITapGestureRecognizer(
)
target: self,
action: #selector(handleTap(_:))
view.addGestureRecognizer(tapGesture)
}
@objc func handleTap(_ sender: UITapGestureRecognizer) {
// code
}
```



## Attributes Inspector

- 각 Recognizer는 서로 다른 속성을 지님
- 공통 부모 클래스인 Gesture Recognizer에 대해서 동일

![스크린샷 2020-01-07 오후 1.16.15](https://tva1.sinaimg.cn/large/006tNbRwgy1ganvkmx1bwj31830u0aop.jpg)



## The states of a gesture

![스크린샷 2020-01-07 오후 1.16.49](https://tva1.sinaimg.cn/large/006tNbRwgy1ganvl7r0voj31b60u04ah.jpg)





