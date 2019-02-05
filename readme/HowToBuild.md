
## Check

* [New ways to verify that Multipath TCP works through your network — MPTCP](http://blog.multipath-tcp.org/blog/html/2015/12/16/mptcp_tools.html): 내 컴퓨터/서버가 MPTCP를 지원하는지 간단히 확인하는 방법을 설명한다.



## Environment

* MultiPath TCP - Linux Kernel implementation
* Login to `user`




## Install

### Install Program

<pre>
$ sudo su
# cd /home/user/
# git clone https://github.com/MPSec/Dashboard.git
# cd ./Dashboard/installer/
# chmod 777 *
# ./set-up.sh
</pre>

### Boot mptcp kernel

* [Boot the mptcp kernel into linux environment.](https://multipath-tcp.org/pmwiki.php/Users/DoItYourself): 다운받은 mptcp 파일을 부팅한다.



## Start

<pre>
$ sudo su
# cd /home/user/Dashboard/installer/
# chmod 777 ./set-start/*
# ./installer/start-mpsec.sh
</pre>
