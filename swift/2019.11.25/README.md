# UIViewController

앱 구조의 뼈대

모든 앱에 반드시 하나 이상,

## View Management





## Two types of view controllers

s

Content View Controllers

모든 뷰를 단독으로 관리 􏰄 􏰋􏰌 􏰜􏰝 􏰞􏰟􏰠􏰚 􏰡􏰢
 􏰄 UIViewController, UITableViewController, UICollectionViewController 􏰣 



Containter View Controllers 



UINavigationController, UITabbarController, UIPageViewController 􏰣 



### Split View Controller 

패드나 상위 아이폰이 뷰를 나누어 앱이용

VIewController Life Cycle 사진 끼기



## Data Marshaling

MVC

자신이 관리하는 뷰와 데이터 사이에 중계역활



## User Interactions

이벤트 처리

뷰컨트롤러는 Responder 객체 :  직접 이벤트를 받아 처리 가능하나 일반적으로 지양

뷰가 그 자신의 터치 이벤트를 연관된 객체에 action 메서드나 delegate로 전달

터치가 됬다는 사일을 전달~



## Resource Management

뷰컨트롤러가 생성한 모든 뷰와 객체들은 뷰 컨트롤러의 책임

뷰컨트롤러의 생명주기에 따라 생성되었다가 자동 소멸되기도 하지만 ARC개념에 맞게 관리 필요

메모리 부족시 didReceiveMemoryWarning 메서드에서 꼭 유지하지 않아도 되는 자원들은 정리 필요

유저의 장에서 무거운앱도 메모리를 잘 사용해주면 

## Adaptivity



뷰컨트롤러는 뷰의 푠현을 책임지고, 현재환경에 적절한 방법으로 적용되도록 할 책임을가짐

아이폰경우 크기가 각 달라 그크기에 맞게 만들어야댐~~!!

# The View Controller Hierarchy



베이스가되는 UIWindow는 그자체로는 유저에게 보여지는 컨텐츠를 가지지 못함

Window는 정확히 하나의 Root View Controller를 가지는데 이것을 통해 컨텐츠를 표현

실제 앱에 표현되는건 이거다



## Presented View Controllers

화면전환하는 방식

하나씩 띄어서 최종적으로 띄어진 화면이 앱에 표시되고 있다!~

노란색을 닫으면 파란색나오고 초록을 닫으면 노란색나오고

## A container & a presented View Controller

유아이네비게이션 컨트롤러 뒤로가기 앞에 덮는형태와는 달리 이자체로는 표현하지않고 실제 내용을 포함하는 차일드뷰컨트롤러를 생성하고 스택으로 쌓임 



# ViewControllerLife Cycle

뷰컨트롤러에서 로드뷰과정은 시스템에서 해주기 떄문에 호출을 안해도 괸찬고 뷰디드로드로 시작한다. 윌은 보여지기 직전 디드는 보여진 후에 

iOS12에서의 내용이고 13도 이제 알아야함







12에서 문제가 안되고 13에서 문제가 되는 이유

13을 기준으로 봤을떄 디드피니쉬위드옵션 최초로 호출되고 버젼에 상관없이 실행되서 두번 실행이 되서 조건문을 걸어주는게 좋음



FullScreen != Sheet

## FullScreen Style

