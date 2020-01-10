# Core Location

기기의 지리적 위치와 방향을 얻기 위한 프레임워크

- 기기의 지리적 위치, 고도, 방향 또는 iBeacon 주변의 상대적 위치를 결정하는 서비스를 제공
- 다음과 같은 모든 사용 가능한 온보드 하드웨어를 이용해 데이터 수집
- CLLocationManager를 이용해 대부분의 서비스를 시작하고 연결된 Delegate를 통해 응답을 수신
- 위치 정보를 얻기 위해 반드시 유저로부터 권한을 얻어야 함
- 크게 위치 업데이트 / 지역 모니터링 / iBeacon / 장치 방향 / 좌표 변환 역활 수행



## Request Authoriztion 

권한 요청 방법

요청을 받아야 동작을 시작할수 있음

앱을 사용하고 있을때만 권한 이용가능

항상 사용 가능

### When-In-use authorization

- 앱이 Foreground 에서 동작 중일 때만 위치 서비스 사용
- 앱을 자동으로 재실행하는 서비스는 사용  불가
- 반드시 Always 를 써야 하는 경우가 아니면 이 방식을 권장. 동시에 한 가지 방식으로만 설정 가능

### Always authorization

- Foreground 나 Background 모두에서 필요할 때 위치 서비스 사용
- 앱이 실행 중이지 않을 때 위치 기반 이벤트가 발생하면 시스템이 앱을 실행하고 이벤트 전달

```swift
let locationManager = CLLocatinoManager()
locationManager.requestWhenInUseAuthorization()
locationManager.requestAlwasAuthoriztion()
```

![스크린샷 2020-01-10 오후 7.11.43](https://tva1.sinaimg.cn/large/006tNbRwgy1garmphxdpjj30kj09w40g.jpg)

info 에서 넣어줘야함

## CLAuthorizationSatus

```swift
//사용자 위치권한 상태 
//CLLocationManager.authorizationStatus()
switch CLLocationManager.authorizationStatus() {
  // 유저가 한번도 체크 안했을때 물어보고 
  // when in use, aways, denied 상태로 나뉘어짐
case .notDetermined:
	locationManager.requestWhenInUseAuthorization()
case .restricted, .denied:
	// Disable location features
	disableMyLocationBasedFeatures()
case .authorizedWhenInUse:
	// Enable basic location features
	enableMyWhenInUseFeatures()
case .authorizedAlways:
	// Enable any of your app's location features
	enableMyAlwaysFeatures()
}
// 이상태에 따라서 델리게이트로 상태를 
```

## Delegate - didChangeAuthorization

```swift
// 권한 설정에대한 것에 따라서호출되어
// 어떤 상태값이 변경될 때 호출되어 이안에서 처리 해줌
func locationManager
	_ manager: CLLocationManager,
	didChangeAuthorization status: CLAuthorizationStatus
){
	switch status {
	case .authorizedWhenInUse, .authorizedAlways:
		print("Authorized")
		default:
		print("Unauthorized")
	}
}
```



## Determining the Availability

위치 서비스를 사용 할 수 없는 상황

- 기기에 이 기능을 지원하는 데 필요한 하드웨어가 없음
- 사용자가 시스템 설정에서 위치 서비스 기능을 끔
- 사용자가 앱의 위치 서비스에 대한 접근을 거부
- 기기가 비행기 모드로 설정되었을 때
- 백그라운드 갱신 기능을 사용할 수 없고 필요한 기능을 우선 순위가 높은 다른 서비스가 이미 사용 중일 때

```swift
// 가용성 체크 
func locationServicesEnabled() -> Bool
func headingAvailable() -> Bool
func significantLocationChangeMonitoringAvailable() -> Bool
func isMonitoringAvailable(for regionClass: Swift.AnyClass) -> Bool
func isRangingAvailable() -> Bool
```



## Getting the User's Location Data

### Standard location service (When-in-use or Always authorization)

- 사용자 위치를 실시간으로 파악하기 위한 범용 솔루션
- 다른 서비스에 비해 더 많은 전력을 쓰지만 가장 정확하고 즉각적인 정보를 제공

### Significant-change location service (Always authorization)

- 전력 소모를 줄이기 위한 것으로 업데이트가 자주 필요하지 않고 GPS 정밀도가 낮아도 되는 경우 사용 
- 사용자 위치를 대폭 변경한 경우에만 업데이트를 제공
- 사용자가 걷고 있을 때 주변의 관심 장소(POI) 에 대한 추천 정보를 제안해주는 등의 서비스를 제공 가능

### Visits location service (Always authorization)

- 가장 효율적으로 전력을 사용하지만 다른 서비스에 비해 업데이트 횟수가 적은 방법

- 유저가 한 장소에 머물러 시간을 보내다가 이동할 때 업데이트 알림 발생(위치 및 시간 정보)

- 사용자의 행동 패턴을 파악하고 그 지식을 앱의 다른 부분에 적용하기 위한 서비스로 활용



## Standard Location Service

- 지정한 설정 값에 따라 정기적인 위치 업데이트를 수행

- 다른 위치 서비스와 달리 When-In-Use 권환에서도 사용 가능

- 위치 정보를 세밀하게 파악해야 하고 자주 업데이트 해야 하는 앱에서 사용

- 높은 정밀도를 필요로 하지 않을 경우 시스템이 알아서 GPS 대신 Wi-Fi 를 이용하는 등의 작업 수행

```swift
func startUpdatingLocation() {
	let status = CLLocationManager.authorizationStatus()
	guard status == .authorizedAlways || status ==
  	.authorizedWhenInUse,
		CLLocationManager.locationServicesEnabled()
		else { return }
	locationManager.desiredAccuracy =
  kCLLocationAccuracyNearestTenMeters
	locationManager.distanceFilter = 10.0
	locationManager.startUpdatingLocation()
}
```



## desiredAccuracy

- 위치 정보의 정밀도 값으로, 반드시 보장되지는 않지만 가능한 한 설정에 가까운 정보를 취합
- 정밀도가 높을 수록 더 많은 전력 소비와 연산 시간이 필요하므로 높은 것이 꼭 좋은 것은 아님
- 높은 정밀도의 위치 정보 요청 시, 우선 가능한 빨리 초기 정보를 받은 뒤 더 정확한 위치 정보를 계속 파악해 더 정확한 정보를 갱신하는 형태로 전달받게 됨
- 기본값 AccuracyBest (iOS, macOS) / AccuracyHundredMeters (watchOS)

```swift
locationManager.desiredAccuracy = kCLLocationAccuracyBest
// 거리에 따른 위치 정밀도
typealias CLLocationAccuracy = Double
let kCLLocationAccuracyBestForNavigation: CLLocationAccuracy
let kCLLocationAccuracyBest: CLLocationAccuracy
let kCLLocationAccuracyNearestTenMeters: CLLocationAccuracy
let kCLLocationAccuracyHundredMeters: CLLocationAccuracy
let kCLLocationAccuracyKilometer: CLLocationAccuracy
let kCLLocationAccuracyThreeKilometers: CLLocationAccuracy
```



## distanceFilter

- 위치 업데이트 이벤트를 발생시키기 위해 필요한 기기의 최소 이동거리 설정
- 기본  kCLDistanceFilterNone (모든 이동 감지시마다 업데이트)
- Standard Location Service 를 사용할 때는 desiredAccuracy 와 distanceFilter 를 설정 필요



## Represent Location Data

```swift
// 위치에대한 정보
class CLLoation
	the latitude, longitdue, and course information reported by the system.

// 좌표값 , 위경도
struct CLLocationCoordinate2D
	the latitude and longit

// 지하철이나 큰 건물 자세한 정보
class CLFloor

// 그 유저의 위치에 대한 위치정보들 
class CLVisit


```

