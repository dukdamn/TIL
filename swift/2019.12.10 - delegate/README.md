![스크린샷 2019-12-10 오후 1.31.38](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rio1h3srj30iv026dgg.jpg)

dark모드일떄 생각해보기



# Delegate

![스크린샷 2019-12-10 오후 2.08.56](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rjqsnwvcj30v406s75l.jpg)

특정 로직을 내가 아닌 다른 객체가 대신 구현하도록 위임하는 형태의 디자인패턴

요청하는 객체와 요청에 응답할 객체로 나누어 작성

주로 다음과 같은 상황에 사용

- 뷰가 받은 이벤트나 상태를 뷰컨트롤러에게 전달하여 처리 (View -> ViewController)
- 뷰 구성에 필요한 정보를 뷰컨트롤러가 결정 (View <- ViewController)
- 주요 코드는 숨기고 특정 상황에 대해서만 커스터마이징 할 수 있도록 제공



## AppDelegate

![스크린샷 2019-12-10 오후 2.11.01](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rjt1dyndj31220qitew.jpg)



왼쪽은 시스템 동작과정

퍼스트 이니셜라이션 하는동안 우리에게 할일이 있는지 기회를 줌

파이널 이니셜라이션 에서 막바지단계에서 할일이 있는지 기회를 줌

시점을 알려주고 어느 단계에 왔다고 알려주고 코드로 동작을 시킬수 있게 해줌



![스크린샷 2019-12-10 오후 2.12.37](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rjungsm3j31380qggsb.jpg)

시스템이 우리에게 작업을 수행할수있게 해줌

몇 각동작의 순간에 기회를 줌



## Delegate protocol

```swift
protocol CustomViewDelegate: class{
	func coloerForBackground(_ newColor: UIColor?) -> UIColor
}

//delegate 선언
final class CustomView: UIView {
	weak var delegate: CustomViewDelegate?
	override var backgroundColor: UIColor? {
		get { return super.backgroundColor }
		set {
			let color = delegate?.colorForBackground(newValue)
			let newColor = color ?? newValue ?? .gray
			super.backgroundColor = newColor
			print("새로 변경될 색은 :", newColor)
		}
	}
}
```

이 함수가 앱델리게이트처럼 생각해서 

색갈이 바뀌는 순간에 델리게이트에게 

커스텀뷰 전체가 시스템의 상황과같이 모른다고 했을떄 delegate만을 사용하여 뉴벨류를 받아 그 뉴벨류에 관하여 작업하여 값을 줌



```swift
// 델리게이트 구현부
class ViewController: UIViewController,                    {
CustomViewDelegate
@IBOutlet weak var customView: CustomView!
	override func viewDidLoad() {
		super.viewDidLoad()
    customView.delegate = self
	}

	func colorForBackground(_ newColor: UIColor?) -> UIColor {
		guard let color = newColor else { return .gray }
		return color == .green ? .blue : color
	}	
}
```



![스크린샷 2019-12-10 오후 2.26.44](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rk9ci4g3j30lg0lsjux.jpg)







![스크린샷 2019-12-10 오후 2.26.57](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rk9lajfdj30la0istcp.jpg)







![스크린샷 2019-12-10 오후 2.27.15](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rk9ut4mhj30ls0ik421.jpg)





![스크린샷 2019-12-10 오후 2.27.26](https://tva1.sinaimg.cn/large/006tNbRwgy1g9rka2e6wxj30l20iw42s.jpg)