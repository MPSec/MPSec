
# Routing example

## 4.2 MPTCP 라우팅 테이블 설정 방법
MPTCP를 사용하기 위해서는 다중 경로에 대한 라우팅 테이블 설정이 필수적이다. 아래의 명령어는 2개의 유선 인터페이스를 가지는 환경에서의 라우팅 설정법을 예로 나타내었다. 2개의 유선 인터페이스에 대한 설정 정보는 아래의 표와 같다.

구분 | IP Address | Subnet | Gateway Address
---------|----------|----------|---------
eth0 | 10.1.1.2 | 255.255.255.0 | 10.1.1.1
eth1 | 10.1.2.2 | 255.255.255.0 | 10.1.2.1

다음과 같은 상황을 구성한 뒤 MPTCP를 사용하기 위해 아래의 명령어를 사용한다.

~~~shell
# ip rule add from 10.1.1.2 table 1
# ip rule add from 10.1.2.2 table 2
# ip route add 10.1.1.0/24 dev eth0 scope link table 1
# ip route add default via 10.1.1.1 dev eth0 table 1
# ip route add 10.1.2.0/24 dev eth1 scope link table 2
# ip route add default via 10.1.2.1 dev eth1 table 2
# ip route add default scope global nexthop via 10.1.1.1 dev eth0
~~~


설정된 라우팅 규칙은 아래의 명령어를 통해 확인할 수 있고, 결과는 아래의 그림과 같이 설정된 라우팅 규칙이다.

~~~shell
# ip rule show
# ip route
# ip route show table 1
# ip route show table 2
~~~

![routing](/md_images/routing.png)
