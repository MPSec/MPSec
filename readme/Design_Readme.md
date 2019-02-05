# Dashboard TestBed

## TestBed 환경 설명
PC1과 PC2에 mptcp kernel을 부팅한다. 먼저 Multi Path 동작 확인의 경우, PC2에서 동영상 파일을 PC1으로 가져와 FFMpeg와 FFServer를 통해 WebM 코덱으로 인코딩하여 브라우저에 실시간으로 스트리밍 한다. 1초마다 PC1의 각 인터페이스 대역폭을 측정한다. 측정한 데이터를 Chart JS를 이용해 그래프로 그려준다. Single Path일 때와 Multi Path일 때의 대역폭 현황을 실시간으로 확인할 수 있다. 두 번째로 IPSec 동작 확인의 경우, PC1에서 PC2의 해당 파일을 ftp 프로토콜을 이용해 가져온다. 구현한 Packet Capture Program과 Shell Script 코드를 동작시켜 Packet의 내용을 캡쳐하여 브라우저에 보여준다. IPSec이 동작된 경우 암호화된 Packet을 아닐 경우 해당 데이터의 내용이 그대로 나오는 것을 확인할 수 있다.

## TestBed 구성 예시

MPTCP Kernel | Multi Path
---------|----------
![vm](/md_images/vm.png) | ![TestBed](/md_images/testSet.png)


## Single Path vs Multi Path

Single Path | Multi Path
---------|----------
![Single Path](/md_images/sptcp.png) | ![Multi Path](/md_images/mptcp.png)


## IPSec

IPSec | empty
---------|----------
![IPSec](/md_images/ipsec.png) | empty





