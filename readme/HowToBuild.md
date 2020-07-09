# HowToBuild

## Check

* [New ways to verify that Multipath TCP works through your network — MPTCP](http://blog.multipath-tcp.org/blog/html/2015/12/16/mptcp_tools.html): 내 컴퓨터/서버가 MPTCP를 지원하는지 간단히 확인하는 방법을 설명한다.
* MultiPath TCP - Linux Kernel implementation
* Ubuntu 16.04 (현재 지원 가능한 버젼)
* Minimum Disk 24GB
* Minimum RAM 4GB



<br/>

## Install & Kernel Build

### Install MPSec

~~~shell
git clone https://github.com/MPSec/Dashboard.git
~~~

### Auto Compile Advanced MPTCP Ubuntu Kernel

> Just Run, Please wait a little longer. :) <br/>
> The currently supported version is `ubuntu:16.04`

~~~shell
./set-up-ubuntu-16.04.sh   # The path is /MPSec/installer
~~~

### Change grub to make kernel select at boot time

> 완료 후 아래와 같이 mptcp 커널로 선택하여 부팅합니다. 

<img src="/assets/mptcp-kernel.png" width="500px" height="380px"/>

~~~shell
dmesg | grep MPTCP # Check mptcp kernel
~~~


<br/>

## Configure Environment

> Pull docker image and Run. <br/>
> If Docker is not installed, install Docker through the following command.

### Install Docker

~~~shell
curl -fsSL https://get.docker.com/ | sudo sh   # Install
sudo usermod -aG docker $USER                  # Give authority to the user who is currently connected
docker version                                 # Check installed
~~~

### Pull and Run MPSec Docker Image

~~~docker
docker run -d -p 1234:8080 wnsgml972/mpsec-app:1
~~~



<br/>

## Open Dashboard

![dashboard](/assets/open.png)





<br/>

## IPSec (Options)

1. [IPSec Configuration](https://github.com/MPSec/Dashboard/blob/master/contents/ipsec.md) **(PC1, PC2)**

<!-- 
FFServer & IPSec 구성
1. `/Dashboard/conf/ffserver.conf` file open -> Add custom IP1 in `ACL allow` **(PC1)**
2. [IPSec Configuration](https://github.com/MPSec/Dashboard/blob/master/contents/ipsec.md) **(PC1, PC2)**
3. wget 사용을 위해 ROOT에 file1 ~ file4 올려놓기 **(PC2)**
4. Custom Network 구성 **(PC1, PC2)**
 -->

