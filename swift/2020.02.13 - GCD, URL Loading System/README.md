# GCD(Grand Central Dispatch)

## History

- 초기에는 마이크로 프로세서의 clock 속도를 높이는 방식으로 연산 속도를 높임
- 점점 증가하는 전력 소비와 발생하는 열로 인해 단일 프로세서의 clock 속도 증가에 한계를 맞게 되었으며, 이는 특히 모바일에서 영향을 크게 받음
- 따라서 CPU 밴더들은 단일 CPU 의 클럭 속도를 개선하는 대신 여러 개의 CPU 를 탑재하는 형태로 효율을 높이는 것에 초점을 맞추게 됨
- 프로세서의 클럭 속도가 빨라지면서 자연스럽게 소프트웨어도 빨라지던 예전고 달리 멀티 코어 프로세서에는 프로세서에서는 멀티 프로세서에게 어떻게 잘 프로그램의 동작을 배분하는 지가 중요해짐
- GCD 이전에는 멀티 스레딩을 위해 Thread 와 OperationQueue 등의 클래스를 사용했는데, Thread 는 복잡하고 Critical Section 등을 이용한 Lock 을 관리하기 까다로웠고, OperationQueue 는 GCD 에 비해 무겁고 Boilerplate 코드들이 필요한 문제가 있음
- GCD (Grand Central Dispatch)는 멀티 코어 프로세서 시스템에 대한 응용 프로그램 지원을 최적화하기 위해 Apple에서 개발한 기술로 스레드 관리와 실행에 대한 책임을 어플리케이션 레벨에서 운영체제 레벨로 넘김
- 작업의 단위는 Block 이라 불리며, DispatchQueue 가 이 Block 들을 관리
- GCD 는 각 어플리케이션에서 생성된 DispatchQueue 를 읽는 멀티코어 실행 엔진을 가지고 있으며, 이것이 Queue에 등록된 각 작업을 꺼내 스레드에 할당 개발자는 내부 동작을 자세히 알 필요 없이 Queue 에 작업을 넘기기만 하면 됨
- Thread 를 직접 생성하고 관리하는 것에 비해 관리 용이성과 이식성, 성능 증가

## Migrating Away from Threads

### GCD의 장점

- 앱의 메모리 공간에 스레드 스택을 저장하기 위한 메모리 페널티 감소
- 스레드를 생성하고 구성하는 데 필요한 코드를 제거하십시오.
- 스레드 작업을 관리하고 스케줄링하는 데 필요한 코드 제거
- 코드를 간소화하다



## Dispatch Framework

멀티코어 하드웨어에서 다중 작업을 동시에 수행할 수 있도록 관리하기 위한 프레임워크

시스템에서 관리하는 DisPatch Queues에 작업을 전달하여 수행

![스크린샷 2020-02-13 오후 1.26.39](https://tva1.sinaimg.cn/large/0082zybpgy1gbunsvwm90j31zg0bwjxu.jpg)





## DispatchQueue

- GCD 는 앱이 블록 객체 형태로 작업을 전송할 수 있는 FIF* 대기열(Queue)을 제공하고 관리
- Queue에 전달된 작업은 시스템이 전적으로 관리하는 스레드 풀(a pool of threads)에서 실행됨*
- 작업이 실행될 스레드는 보장되지 않음
- DispatchQueue는 2개의 타입( Serial / Concurrent )으로 구분되며 둘 모두 FIFO 순서로 처리 
- 앱을 실행하면 시스템이 자동으로 메인스레드 위에서 동작하는Main큐(Serial Queue)를 만들어 작업을 수행하고, 그 외에 추가적으로 여러 개의 Global 큐 (Cuncurrent Queue)를 만들어서 큐를 관리
- 각 작업은 동기(sync) 방식과 비동기(async) 방식으로 실행 가능하지만 Main큐에서는async 만 사용 가능

## WorkItem Execution

### Synchronous (동기)

sync 메서드를 이용해 동기적으로 실행되면, 작업이 완료될 때까지 대기한 뒤 메서드에서 return 호출 해당 스레드의 다른 작업들은 모두 일시 정지

### Ansynchronous (비동기)

async 메서드를 이용해 비동기적으로 실행되면, 즉시 메서드에서 return 을 호출하고 작업을 수행





# URL Loading System

- URL과 상호작용하고 표준 인터넷 프로토콜을 통해 서버와 통신하기 위한 시스템



## URLSesstion

- 네트워크 데이터 전송 작업에 관련된 클래스 그룹을 조정하는 객체 (네트워크용 API)