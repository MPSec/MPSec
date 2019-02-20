
# MPSec

## Project Purpose
`MPSec(Multipath Security)`는 다중 경로 전송 기술인 mptcp 프로토콜을 활용하여 네트워크 장애 상황에 효과적으로 대처가 가능한 고신뢰 네트워킹을 제공한다.




<br/>

## Key Features
핵심 기능으로는 크게 6가지가 있다. 
* 다중 경로 전송을 통해 장애 상황에 네트워크가 끊기지 않게 네트워크의 생존성을 증가해준다. 
* 비슷한 대역폭으로 여러 개의 경로를 통해 데이터를 전송할 시 2개의 대역폭 당 약 1.8배의 속도로 데이터를 전달한다. 
* 만약 둘 중 하나의 PC에서만 `MPTCP` 프로토콜이 이용 가능할 경우 기존 `TCP` 방식을 통해 통신하기 때문에 호환성 또한 뛰어나다고 할 수 있다.
* `IPSec`을 통한 Packet 암호화를 통해 목적지까지 데이터가 전달되는 동안 Packet의 내용을 볼 수 없도록 한다. 
* `Dashboard`를 활용한 실시간 모니터링으로 사용자가 `MPSec` 환경을 효과적으로 관리할 수 있도록 한다. 
* `Dashboard`에서는 각 인터페이스의 통신 상태, 패킷 보안 상태, MPSec이 동작되는 System의 여러 정보들을 모니터링 할 수 있다.
* **`Installer`를 통해 이 모든 환경을 매우 손쉽게 구성할 수 있다.**




<br/>

## Examples of use
### Army
군대와 같이 중요한 서버가 있으며 네트워크가 끊겨서는 안 되는 장소에서, 다중 경로 전송을 통해 만약 하나의 인터페이스가 끊겨도 다른 인터페이스로 데이터를 전송함으로써 네트워크의 생존성을 증가시킬 수 있다. 또한 `IPSec`을 통해 보안이 중요한 군시설에 Packet의 내용을 볼 수 없도록 할 수 있다. 

### High-definition streaming
고화질 영상의 경우 빠르고 안정적인 데이터 전송을 유지해야한다. `MPTCP`를 이용해 여러 개의 인터페이스를 연결하여 빠르고 끊기지 않게 영상을 전송할 수 있다.


<br/>

## TestBed

![testbed](/md_images/testSet.png)

PC1과 PC2에 mptcp kernel을 부팅한다. 먼저 Multi Path 동작 확인의 경우, PC2에서 동영상 파일을 PC1으로 가져와 FFMpeg와 FFServer를 통해 WebM 코덱으로 인코딩하여 브라우저에 실시간으로 스트리밍 한다. 1초마다 PC1의 각 인터페이스 대역폭을 측정한다. 측정한 데이터를 Chart JS를 이용해 그래프로 그려준다. Single Path일 때와 Multi Path일 때의 대역폭 현황을 실시간으로 확인할 수 있다. 두 번째로 IPSec 동작 확인의 경우, PC1에서 PC2의 해당 파일을 ftp 프로토콜을 이용해 가져온다. 구현한 Packet Capture Program과 Shell Script 코드를 동작시켜 Packet의 내용을 캡쳐하여 브라우저에 보여준다. IPSec이 동작된 경우 암호화된 Packet을 아닐 경우 해당 데이터의 내용이 그대로 나오는 것을 확인할 수 있다.



<br/>

## Good documentation for additional reference

* [IPSec](/contents/ipsec.md)
* [Routing example](/contents/routing.md)
* [Bandwidth](/contents/bandwidth.md)
* [VM (create more than 5 adapter)](/contents/in_vm_create_more_than_5_adapter.md)



<br/>

## MPTCP protocol analysis

### MPTCP Structure

`MPTCP`는 전송계층 프로토콜의 한 종류로  사용자와 서버 사이에 2가지 이상의 네트워킹 인터페이스를 활용하여 하나의 `TCP` 스트림을 다중 경로로 전송하는 전송 계층의 프로토콜을 의미한다. 이때 각각의 네트워킹 인터페이스로 나뉘어진 `TCP` 스트림은 `subflow`라 부른다.

하나의 어플리케이션은 `MPTCP`를 활용하여 여러 개의 `TCP subflow`를 생성하고 생성된 `subflow`들로 동시에 전송하여 데이터 전송률을 높이거나 번갈아가며 사용하여 인터페이스의 부하를 줄일 수 있다. 또한 `MPTCP`는 기존 `TCP Header`의 옵션 필드를 활용하여 사용자-서버 간 `MPTCP` 제어 데이터를 송수신하기 때문에 `MPTCP`가 설치되있지 않은 단말이더라도 `TCP`로 인식하여 처리하기 때문에 호환성이 뛰어나다고 할 수 있다.

### MPTCP features

#### Path-Manager

`MPTCP Path-Manager`는 사용자-서버 간의 **다중 경로 생성**에 있어 어떠한 방식으로 다중 경로를 생성할지를 결정하는 기능으로 크게 3가지의 설정 방법을 제공한다.

* `default – default` 방식은 MPTCP를 사용하지 않는 일반적인 단일 경로 전송 방식으로 단말이 자기가 가진 인터페이스 정보와 이를 통해 만들 수 있는 subflow 정보를 전달하지 않는다.
* `fullmesh – fullmesh` 방식은 MPTCP에서 가장 많이 사용되는 방식으로 사용자가 가진 인터페이스의 개수와 서버가 가진 인터페이스의 개수를 조합하여 모든 경우의 수로 가는 다중 경로를 생성하는 방식이다.
* `ndiffports – ndiffports` 방식은 기존의 하나의 인터페이스만을 사용하여 통신하는 환경에서 송신측 단말의 TCP 포트를 여러 개 생성하여 가상으로 다중 경로를 생성하는 방식이다.

#### Scheduler

`MPTCP Scheduler`는 `Path-Manager`를 통해 사용자-서버 사이에 생성된 **다중 경로 중 어떠한 경로를 선택**하여 데이터를 전송할지 결정하는 기능으로 크게 3 가지의 설정 방법을 제공한다.

* `default – default` 스케줄러는 MPTCP에서 가장 많이 사용되는 스케줄러로 여러 가지 subflow 중 가장 RTT가 적은 subflow를 선택하여 해당 subflow의 congestion window가 가득 찰 때까지 데이터를 전송한다. 만약 선택된 subflow의 congestion window가 가득 찬 경우 그 다음 적은 RTT를 가지는 subflow를 선택하여 데이터를 전송한다. 
* `roundrobin – roundrobin` 스케줄러는 존재하는 모든 subflow에 설정된 TCP segment 수에 따라 순차적으로 데이터를 전송하는 방식으로 인터페이스 별 부하분산 기능을 극대화하여 사용할 때 주로 사용한다.
* `redundant – redundant` 스케줄러는 생성된 모든 subflow에 동일한 데이터를 중복적으로 송신하는 방식으로 이를 수신한 단말에서는 수신한 각 패킷의 sequence number와 time stamp 값을 비교하여 동일 데이터 중 먼저 수신한 데이터를 가지고 이후에 들어오는 데이터는 버리는 방식으로 동작하며 가용 가능한 네트워크 대역폭을 희생하여 신뢰성을 보장하는 서비스를 사용하고자 할 때 주로 사용한다.

#### Congestion Control

`MPTCP Congestion Control`는 기존 TCP의 Congestion Control과 유사한 기능을 담당한다. 하지만 기존 TCP Congestion Control은 하나의 경로에 대한 congestion window size를 계산하는 Uncoupled 방식의 알고리즘으로 여러 subflow를 가지는 MPTCP 환경에서 사용하기 적절하지 않다. 따라서 MPTCP Congestion Control은 MPTCP Scheduler의 결정을 보다 효율적으로 하기 위해 congestion window size 계산 시 가용 가능한 모든 subflow의 상황을 보며 window size를 결정하는 Coupled 방식의 알고리즘을 제공한다. 제공하는 알고리즘은 크게 4가지가 있다.

* LIA (Linked Increase Algorithm)
* OLIA (Opportunistic Linked Increase Algorithm)
* wVegas (Delay-based Congestion Control for MPTCP)
* BALIA (Balanced Linked Adaptation Congestion Control Algorithm)

#### Reordering

`MPTCP Reordering` 기능은 여러 subflow로 전송한 데이터를 수신한 단말이 이를 원상복구 시키기 위해 데이터 재조립을 사용한다. 


