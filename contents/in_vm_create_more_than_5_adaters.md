## In VM create more than 5 Adapters

## 추가 설명

* 기본적으로는 VB 에서 어뎁터가 4개로 설정되어 있음
* nic는 어뎁터 이름

![추가설명](/md_images/1.jpg)

1. Hosy-Only 네트워크 망은 실제 VM에서 하나로 ```VirtualBox Host-Only Ethernet Adapter #2``` 라는 이름으로 만들어져 있음
2. 이 네트워크 망 하나만 이용하여 어뎁터를 총 4개까지 연결, 서브넷 마스크 24로 유지하여 ip를 0.0까지 고정하고 3번째 부터 달리 하면, 각각의 네트워크 망을 생성 할 수는 있음
3. 그러나 결국 하나의 네트워크 망에 있기 때문에 __와이어 샤크로 캡쳐해보면 모든 데이터를 볼 수 있음__
4. 그렇기 때문에 실제 처럼 구성하기 위해 VM Manager에서 __파일 -> 호스트 네트워크 관리자 -> 생성__ 을 해줘야만 각각의 독립된 네트워크 망을 생성할 수 있고 여기서 각각 하나 씩 어뎁터를 연결하면 실제와 유사한 네트워크 환경을 구성할 수 있음


### nic5 생성

1. cmd (관리자 모드)

2. C:\Program Files\Oracle\VirtualBox\

3. vboxmanage modifyvm vm-name --nic5 hostonly --cableconnected5 on --hostonlyadapter5 "VirtualBox Host-Only Ethernet Adapter #11" --nicpromisc5 allow-all

4. vboxmanage modifyvm vm-name2 --nic5 hostonly --cableconnected5 on --hostonlyadapter5 "VirtualBox Host-Only Ethernet Adapter #11" --nicpromisc5 allow-all

5. 현재 존재하는 Adaptor #와 연결하기 (없으며 만들고 생성된 번호와 연결하기)

6. VM shutdown 후 실행
