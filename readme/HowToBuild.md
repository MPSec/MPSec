# Very simple to install and run.

## Check

* [New ways to verify that Multipath TCP works through your network — MPTCP](http://blog.multipath-tcp.org/blog/html/2015/12/16/mptcp_tools.html): 내 컴퓨터/서버가 MPTCP를 지원하는지 간단히 확인하는 방법을 설명한다.



<br/>

## Environment

* MultiPath TCP - Linux Kernel implementation
* Disk 32GB
* LAM 4GB
* Login to `user`




<br/>

## Install

### Download install program

<pre>
$ sudo su
# cd /home/user/
# git clone https://github.com/MPSec/Dashboard.git (git으로 다운)
# cd ./Dashboard/installer/
# chmod 777 * (shell 프로그램 사용 가능하게 권한 변경)
# ./set-up.sh (프로그램 실행)
</pre>


### Compile mptcp kernel

> 꽤 많은 시간이 소요됩니다.

<pre>
$ sudo su
# cd /home/user/mptcp (install program을 통해 받은 디렉토리)
# make mrproper (기존 커널 config 내용 초기화)
# make menuconfig (MPTCP 내용 검색 후 모든 기능 enable 후 .config 파일에 저장)
# make –j 6 (일반적으로 core 개수 * 1.5배)
# make modules_install
# make install
</pre>

### Change grub to make kernel select at boot time

> 완료 후 아래와 같이 mptcp 커널로 선택하여 부팅합니다. 

<pre>
# vi /etc/default/grub (아래 2개 주석처리, 주석은 # 추가)
       GRUB_HIDDEN_TIMEOUT=0
       GRUB_HIDDEN_TIMEOUT_QUIT=true
# update-grub
# reboot (재부팅 시 Advanced option for linux 선택 후 4.4.110+ 커널 선택 후 부팅, 버젼 업그레드 될 수 있음!)
$ dmesg | grep MPTCP (MPTCP 커널로 정상 부팅했는지 확인)
</pre>


<img src="/md_images/mptcp-kernel.png" width="500px" height="380px"/>


<br/>

## Start MPSec

<pre>
# cd /home/user/Dashboard/installer/
# ./start-mpsec.sh
</pre>

<img src="/md_images/start-mpsec.gif" width="500px" height="380px"/>
