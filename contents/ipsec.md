
## IpSec

### 1) IPSec 설치

<pre>
$ sudo apt install strongswan-starter
</pre>

### 2-1) ipsec  설정 (HOST1)

* $ cat /etc/ipsec.conf

<pre>
#ipsec.conf - strongSwan IPsec configuration file
config setup

conn %default
        ikelifetime=60m
        keylife=20m
        rekeymargin=3m
        keyingtries=1

conn gw12-8
        keyexchange=ikev2
        left=192.168.10.1
        leftid=192.168.10.1
        right=192.168.10.2
        rightid=192.168.10.2
        auto=start
        ike=aes128-md5-modp1024!
        esp=aes128-sha1-modp1024!
        type=transport
        authby=secret
</pre>

<br/>

* $ cat /etc/ipsec.secrets

<pre>
# This file holds shared secrets or RSA private keys for authentication.
# RSA private key for this host, authenticating it to any other host
# which knows the public part.
192.168.10.1 192.168.10.2 : PSK "1234567890"
</pre>


### 2-2) ipsec  설정 (HOST2)

* $ cat /etc/ipsec.conf

<pre>
#ipsec.conf - strongSwan IPsec configuration file
config setup

conn %default
        ikelifetime=60m
        keylife=20m
        rekeymargin=3m
        keyingtries=1

conn gw21-8
        keyexchange=ikev2
        left=192.168.10.2
        leftid=192.168.10.2
        right=192.168.10.1
        rightid=192.168.10.1
        auto=start
        ike=aes128-md5-modp1024!
        esp=aes128-sha1-modp1024!
        type=transport
        authby=secret
</pre>

<br/>

* $ cat /etc/ipsec.secrets

<pre>
# This file holds shared secrets or RSA private keys for authentication.
# RSA private key for this host, authenticating it to any other host
# which knows the public part.
192.168.10.2 192.168.10.1 : PSK "1234567890"

</pre>

### 3) IPsec  실행

<pre>
$ sudo ipsec start
</pre>

### 4) IPsec  정지

<pre>
$ sudo ipsec stop
</pre>
