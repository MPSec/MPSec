# Development description for contribute

## Done
- ubuntu 16.04 OS에 mptcp 커널 부팅
- network 환경 구축 및 Testbed Docs
- ffmpeg를 이용한 스트리밍 환경 구축
- Dashboard 구현
- 자동화와 GUI bash 명령어 실행을 위한 각종 스크립트 코드 구현
- packet capture program 구현
- system config output program 구현
- install program 구현
- 문서화


## 환경 설정 (ubuntu 16.04, tomcat 8, mptcp 커널로 부팅)
* mptcp kernel
  * <https://www.multipath-tcp.org/>
  * [MPSec Installer](https://github.com/MPSec/Dashboard/blob/master/readme/HowToBuild.md)
* Tomcat
  * <https://wnsgml972.github.io/linux/linux_ubuntu_tomcat.html>
  * [MPSec Installer](https://github.com/MPSec/Dashboard/blob/master/readme/HowToBuild.md)  
* JSP
  * <https://wnsgml972.github.io/linux/linux_jsp.html>
  * [MPSec Installer](https://github.com/MPSec/Dashboard/blob/master/readme/HowToBuild.md)  
* ffserver conf 를 이용한 ffserver 실행
  * 설치 <https://wnsgml972.github.io/ffmpeg/ffmpeg_ffserver_config.html>
  * 사용법 <https://wnsgml972.github.io/ffmpeg/ffmpeg_ffserver_streamming.html>
  * [MPSec Installer](https://github.com/MPSec/Dashboard/blob/master/readme/HowToBuild.md)  
* localhost Interface 설정
  * [localhost Interface](/contents/localhost.md)
* IpSec
  * [IpSec](/contents/ipsec.md)
* VM 사용 시
  * [VM Adapter 5](/contents/in_vm_create_more_than_5_adapter.md), (5개 이상의 어뎁터 생성)
  * [Network 대역폭 제한](/conf/limit-network-state)
* System Config Output
    * [System Config Output](/contents/system.md), 기본 제공 기능
* Routing
    * [Routing example](/contents/routing.md)

<br/>

## 개발 시 검색 키워드 [ 조절 ]
* 프로그래밍 시 url path나 chart를 수정


<hr/>

### HTML
* index.html,  MPTCP
* index2.html, IPSec
* index4.html, System

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
[]  * 유선 인터페이스 IP 설정
* build/js/custom.jun.js
  * 커스텀 자바 스크립트

### Flow
* 버튼 클릭 시
  1. jsp 코드 호출
  2. jsp 코드 내에서 프로세스 빌더를 이용해 쉘 스크립트 실행
  3. 결과를 ajax로 가져와 실행
* onload시 1초마다 쉘 스크립트를 실행하여 네트워크 대역폭을 line chart에 대입
* JSP를 이용한 쉘 스크립트 실행 <https://wnsgml972.github.io/linux/linux_shellscript.html>
