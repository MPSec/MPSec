
# MPSec

## Project Purpose
`MPSec(Multipath Security)`는 다중 경로 전송 기술인 mptcp 프로토콜을 활용하여 네트워크 장애 상황에 효과적으로 대처가 가능한 고신뢰 네트워킹을 제공한다.




<br/>

## Key Features
핵심 기능으로는 크게 6가지가 있다. 
* 다중 경로 전송을 통해 장애 상황에 네트워크가 끊기지 않게 네트워크의 생존성을 증가해준다. 
* 비슷한 대역폭으로 여러 개의 경로를 통해 데이터를 전송할 시 2개의 대역폭 당 약 1.8배의 속도로 데이터를 전달한다. 
* `Dashboard`를 활용한 실시간 모니터링으로 사용자가 `MPSec` 환경을 효과적으로 관리할 수 있도록 한다. 
* `IPSec`을 통한 Packet 암호화를 통해 목적지까지 데이터가 전달되는 동안 Packet의 내용을 볼 수 없도록 한다. 
* 만약 둘 중 하나의 PC에서만 `MPTCP` 프로토콜이 이용 가능할 경우 기존 `TCP` 방식을 통해 통신하기 때문에 호환성 또한 뛰어나다고 할 수 있다.
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
* [VM (create more than 5 adapter)](in_vm_create_more_than_5_adapter.md)


<br/>

## Benefit (정리중)

### mptcp
* 대체 경로 서비스 (생존성 증가)
* 다중 경로 전송 서비스 (속도 증가)
* 기존 TCP 프로토콜과의 호환성

전문가가 아니라면 사용하는 방법이 너무 어려움...  `그렇기 때문에 mpsec 사용`

### mpsec
* dashboard를 통한 효과적인 네트워크 관리
* installer를 통한 쉬운 환경 구성
* ipsec을 통한 데이터 보안 기능 제공

