Use Core Data : 

Include Unit Tests, Include Ui Tests : 프로젝트의 코트를 테스트해서 미리 앱이 돌아가기전에 체크



Souce Control : Git init 해주는것



## Xcode : 통합 개발 환경

### Toolbar

실행, 툴바,유틸리티 도구사용, 시뮬레이터 실행, 바꾸기, 

### Navigator 



### Editor

### Debug Area

### Utilities

### Project Editor : 프로젝트 파일 누르면 보임

Minimap  : 전반적 상황을 미니맵으로

Jump Bar : 경로 가기









# The App Life Cycle

## The Structure of an App

애플이 어플을 만들떄 어떠한 식으로 만들지의 구조

Model 데이터를 다루는 것에 따라 양이 달라짐

View 아이폰에서 사용자가 보게되는 화면 구성, 오브젝트를 뷰에 넣음

Controler 뷰와 모델 사이에 데이터를 주고받거나 소통할수 있는 매개체

## The Main Run Loop

내부적 동작 과정

Event queue fifo 먼저 한것에대해 실행

Main run loop 계속해서 event에 반응함 하고 Appllcation object에 전달

Core object 들이 세부적으로 동작수 OS에 전달



## Common types of event

Location 지도

Redrwo 그림

## State changes in an iOS app

생명주기

앱,뷰, 등 생명주기 

처음에 어떻게 시작해서 어떤단계로 넘어가고 처리하는 동작과정

Not Running: 실행되지 않았거나, 시스템에 의해 종료된 상태

Inactive  실행 중이지만 이벤트를 받고 있지 않은 상태. 실행중일떄 다른 작업을 할때 예를 앱실행 도중 전화 받을때 

Active 어플리케이션이 실질적으로 활동하고 있는상태

Background 백그라운드 상태에서 실질적인 동작을 하고 있는 상태. 예를 들어 백그라운드에서 음악을 실행 하거나, 걸어온 길을 트래킹 하는 등의 동작을 뜻함.ex) 지도나 음악의 경우 

Suspend 백그라운드 상태에서 활동을 멈춘 상태. 빠른 재실행을 위하여 메모리에 적재된 상태이지만 실질적으로 동작하고 있지는 않음. 메모리가 부족할 때 비로소 시스템이 강제종료하게됨. - 이전의 화면이 에서 오면 Suspend , 시스템이 종료되면 Not Running 상태로 실행



## Execution States for Apps

시점마다 작업할수 있는 메서드 제공



iOS 13 부터 SceneDelegate 추가됨

현업에서는 일반적으로 현버전에서 -2 ~ -3 까지 지원 금융은 -4



SceneDelegate



## Lunch Time

메인클래스 생성

유아이관련 파일 로드

최초로 초기화가 이루어짐 - 첫 코드

이전의 작업의 종료된것을 확인 복원

초기화의 마지막단계 , 초기화의 초초시점??>???





### Into the forground

앱을 활성화 시키고 

이벤트 루프로 사용자의 작업을 확인하다가 입력받으면 처리



### Into the background

아까 호출됬던 메소드가 들어옴

작업이있음 처리하고 없으면 넘어감

핸들이벤트가 됨녀 모니터이 이벤트에 들어가 작업

### Handing alert-based interruption





// 1. SceneDelegate 사용할떄

// iOS 13 미만일 떄(현업이나 개인앱 낼 때)

// available 명시, AppDelegate에 window 프로퍼티 추가

// @available(iOS 13, *)



// iOS 13 이상 + SceneDelegate 사용일 떄

// -> AppDelegate랑 SceneDelegate 무시





// 2. SceneDelegate 사용하지 않을 때 (AppDelegate만 사용할 떄)

// -> SceneDelegate 삭제

// -> AppDelegate에서 Scene관련 데이터 삭제

// -> Info.plist에서 Application Scene Manifest 키 샂게



// iOS 12이하일 때

// iOS 13이상일 때



// Xcode 10까지는 AppDelegate.swift

// Xcode 11부터는







## Story bored

하나의 단계를 씬으로 생각 씬델리게이트랑 다름

