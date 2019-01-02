# MPSec Dashboard 정리

## Overview

### 프로젝트의 목적
다중 경로 전송 기술인 MPTCP를 활용하여 네트워크 장애 상황에 효과적으로 대처가 가능한 고신뢰 네트워킹을 제공하며, Dashboard를 통한 실시간 모니터링을 통해 사용자가 효과적으로 관리할 수 있도록 한다.

### 핵심 기능
크게 3가지의 핵심 기능이 있다. 첫 번째는 다중 경로 전송을 통해 장애 상황에 네트워크가 끊기지 않게 네트워크의 생존성을 증가해준다. 두 번째는 비슷한 대역폭으로 여러 개의 경로를 통해 데이터를 전송할 시 2개의 대역폭 당 약 1.8배의 속도로 데이터를 전달한다. 마지막으로 IPSec을 통한 Packet 암호화를 통해 목적지까지 데이터가 전달되는 동안 Packet의 내용을 볼 수 없도록 한다.

### 주요 사용지
첫 번째 예시로 군대와 같이 중요한 서버가 있는 네트워크가 끊겨서는 안 되는 장소에서 다중 경로 전송을 통해 만약 하나의 인터페이스가 끊겨도 다른 인터페이스로 데이터를 전송함으로써 네트워크의 생존성을 증가시킬 수 있다. 또한 IPSec을 통해 보안이 중요한 군시설에 Packet의 내용을 볼 수 없도록 할 수 있다. 두 번째 예시로 고화질 영상의 경우 끊기지 않게 빨리 보내져야 하는데 다중 경로 전송을 이용해 여러 개의 인터페이스를 연결하여 끊기지 않게 영상을 전송할 수 있다.

### MPTCP 기본 구조
MPTCP는 전송 계층 프로토콜의 한 종류이며 사용자와 서버 사이의 2가지 이상의 네트워킹 인터페이스를 활용하여 하나의 TCP 스트림을 다중 경로로 전송할 수 있는 프로토콜이다. 만약 둘 중 하나의 경우만 MPTCP 프로토콜이 이용 가능할 경우 기존 TCP 방식을 통해 통신하기 때문에 호환성 또한 뛰어나다고 할 수 있다.

<br/><br/>

## Dashboard

### 테스트 베드 환경 설명
PC1과 PC2에 mptcp kernel을 부팅한다. 먼저 Multi Path 동작 확인의 경우, PC2에서 동영상 파일을 PC1으로 가져와 FFMpeg와 FFServer를 통해 WebM 코덱으로 인코딩하여 브라우저에 실시간으로 스트리밍 한다. 1초마다 PC1의 각 인터페이스 대역폭을 측정한다. 측정한 데이터를 Chart JS를 이용해 그래프로 그려준다. Single Path일 때와 Multi Path일 때의 대역폭 현황을 실시간으로 확인할 수 있다. 두 번째로 IPSec 동작 확인의 경우, PC1에서 PC2의 해당 파일을 ftp 프로토콜을 이용해 가져온다. 구현한 Packet Capture Program과 Shell Script 코드를 동작시켜 Packet의 내용을 캡쳐하여 브라우저에 보여준다. IPSec이 동작된 경우 암호화된 Packet을 아닐 경우 해당 데이터의 내용이 그대로 나오는 것을 확인할 수 있다.

### 가상 머신을 이용 (mptcp kernel)

![vm](/md_images/vm.png)

### TestBed 구성 예시

![TestBed](/md_images/testSet.png)

### Single Path

![Single Path](/md_images/sptcp.png)

### Multi Path

![Multi Path](/md_images/mptcp.png)

### IPSec

![IPSec](/md_images/ipsec.png)

<br/><br/>

## 환경 설정 (ubuntu 16.04, tomcat 8, mptcp 커널로 부팅)
* mptcp kernel
  * <https://www.multipath-tcp.org/>
* Tomcat
  * <https://wnsgml972.github.io/linux/linux_ubuntu_tomcat.html>
* JSP
  * <https://wnsgml972.github.io/linux/linux_jsp.html>
* ffserver conf 를 이용한 ffserver 실행
  * 설치 <https://wnsgml972.github.io/ffmpeg/ffmpeg_ffserver_config.html>
  * 사용법 <https://wnsgml972.github.io/ffmpeg/ffmpeg_ffserver_streamming.html>
* localhost Interface 설정
  * [localhost Interface](/contents/localhost.md)
* IpSec
  * [IpSec](/contents/ipsec.md)
* VM 사용 시
  * [VM Adapter 5](/contents/in_vm_create_more_than_5_adaters.md), (5개 이상의 어뎁터 생성)
  * [Network 대역폭 제한](/conf/limit-network-state)


<br/>

## clone시 할 것 (user로 로그인 하면 편함!)
  1. /dashboard/conf/ffserver.conf의 ACL allow에 스트리밍 서버를 올릴 ip 추가  [conf 파일 변경]
  2. /dashboard/WebContent/jsp/* 파일들의 실행 path 모두 변경 [user로 로그인 시 필요 없음]
  4. wget 사용을 위해 상대방 컴퓨터의 ROOT에 file1 ~ file4 올려놓기
  5. ipsec-sh 디렉토리의 path 변경 [user로 로그인 시 필요 없음]
  6. ffserver on

## 개발 시 검색 키워드 [ 조절 ]
* 프로그래밍 시 url path나 chart를 수정

<hr/>

### HTML
* index.html,  MPTCP
* index2.html, IPSec
* system.html (추 후)

### Directory
* jsp
  * process build bath 조절
* conf
  * ffserver.conf  
  * VM local 환경에서 네트워크 대역폭 한계 설정 명령어 모음, 수신량만 조절 가능, 송신량은 조절 불가
* etri-jsp-sh
  * 쉘 스크립트 모음
  * ifdown ifup, 원하는 인터페이스 down 또는 up 조절
  * play-ffmpeg, input url 조절
  * bw.sh 네트워크 대역폭 1초마다 계속,  bw1.sh 네트워크 대역폭 한번
  * [Bandwidth Readme](/contents/bandwidth.md)
* ipsec-sh
  * 쉘 스크립트 모음
  * wget, capture 프로그램 개발

### Java Script
* build/js/custom.min.js
  * junhee code 주석 검색 (제일 위, 제일 아래)
  * lineChart 검색( 여기서 네트워크 대역폭 차트 조절 )
* build/js/custom.jun.js
  * 커스텀 자바 스크립트

### Flow
* 버튼 클릭 시
  1. jsp 코드 호출
  2. jsp 코드 내에서 프로세스 빌더를 이용해 쉘 스크립트 실행
  3. 결과를 ajax로 가져와 실행
* onload시 1초마다 쉘 스크립트를 실행하여 네트워크 대역폭을 line chart에 대입
* JSP를 이용한 쉘 스크립트 실행 <https://wnsgml972.github.io/linux/linux_shellscript.html>
