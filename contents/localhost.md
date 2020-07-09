
# localhost

## ifconfig 했을떄 인터페이스 이름 뒤에  : 이 나오게

~~~shell
sudo apt-get install net-tools
~~~

## hostname -i 했을떄 실게 ip가 출력되게

~~~shell
$ cat /etc/hosts
127.0.0.1       localhost
129.254.197.48  m3p-gw

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
~~~

## 확인

~~~shell
$ cat /etc/hostname
m3p-gw
~~~
