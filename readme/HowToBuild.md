
## Check

* [New ways to verify that Multipath TCP works through your network — MPTCP](http://blog.multipath-tcp.org/blog/html/2015/12/16/mptcp_tools.html): 내 컴퓨터/서버가 MPTCP를 지원하는지 간단히 확인하는 방법을 설명한다.
* MultiPath TCP - Linux Kernel implementation
* Minimum Disk 24GB
* Minimum RAM 4GB



<br/>

## Install & Build

### Install MPSec

~~~shell
$ sudo su
# cd /home/user/
# git clone https://github.com/MPSec/Dashboard.git (git으로 다운)
# cd ./Dashboard/installer/
# chmod 777 * (shell 프로그램 사용 가능하게 권한 변경)
# ./set-up.sh (프로그램 실행)
~~~


### Compile mptcp kernel

> 꽤 많은 시간이 소요됩니다.

~~~shell
$ sudo su
# cd /home/user/mptcp (install program을 통해 받은 디렉토리)
# make mrproper (기존 커널 config 내용 초기화)
# make menuconfig (MPTCP 내용 검색 후 모든 기능 enable 후 .config 파일에 저장)
# make –j 6 (일반적으로 core 개수 * 1.5배)
# make modules_install
# make install
~~~

### Change grub to make kernel select at boot time

> 완료 후 아래와 같이 mptcp 커널로 선택하여 부팅합니다. 

~~~shell
# vi /etc/default/grub (아래 2개 주석처리, 주석은 # 추가)
       GRUB_HIDDEN_TIMEOUT=0
       GRUB_HIDDEN_TIMEOUT_QUIT=true
# update-grub
# reboot (재부팅 시 Advanced option for linux 선택 후 4.4.110+ 커널 선택 후 부팅, 버젼 업그레드 될 수 있음!)
$ dmesg | grep MPTCP (MPTCP 커널로 정상 부팅했는지 확인)
~~~


<img src="/md_images/mptcp-kernel.png" width="500px" height="380px"/>


<br/>

## Configure Environment

### Overview

> [Details readme](./Design_Readme.md)

![set](/md_images/overview.png)

### Easy
1. Login to user **(PC1)**
2. `/Dashboard/conf/ffserver.conf` file open -> Add custom IP1 in `ACL allow` **(PC1)**
3. [IPSec Configuration](https://github.com/MPSec/Dashboard/blob/master/contents/ipsec.md) **(PC1, PC2)**
4. IP settings as shown above **(PC1, PC2)**
5. Start MPSec **(PC1)**

### Custom
1. `/Dashboard/WebContent/jsp/*` 파일들의 실행 path 모두 변경 **(PC1)**
2. ipsec-sh 디렉토리의 path 변경
3. `/Dashboard/conf/ffserver.conf` file open -> Add custom IP1 in `ACL allow` **(PC1)**
4. [IPSec Configuration](https://github.com/MPSec/Dashboard/blob/master/contents/ipsec.md) **(PC1, PC2)**
5. wget 사용을 위해 ROOT에 file1 ~ file4 올려놓기 **(PC2)**
6. Custom Network 구성 **(PC1, PC2)**
6. 구성된 Network IP 설정, `/Dashboard/WebContent/build/js/custom.min.js` 제일 아래에 IP 입력 **(PC1)**
7. Start MPSec **(PC1)**




<br/>

## Start MPSec

~~~shell
# cd /home/user/Dashboard/installer/
# ./start-mpsec.sh
~~~

<img src="/md_images/start-mpsec.gif" width="500px" height="380px"/>
