
# 쉘 스크립트

## (실행 $./bw.sh enp0s8) : 기능 검증용

~~~shell
#!/bin/bash

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi

IF=$1

while true
do
        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TMBPS=`expr $TBPS \* 8 / 1024 / 1024`
        RMBPS=`expr $RBPS \* 8 / 1024 / 1024`
        TTBPS=`expr $TMBPS + $RMBPS`
#      echo "$1 TX $TMBPS Mbits/s RX $RMBPS Mbits/s TOT $TTBPS Mbits/s"
        echo "$TTBPS Mbits/s"
done
~~~

<hr>

## (실행 ./bw1.sh enp0s8) : 1회 측정

~~~shell
#!/bin/bash

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi

IF=$1

        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TMBPS=`expr $TBPS \* 8 / 1024 / 1024`
        RMBPS=`expr $RBPS \* 8 / 1024 / 1024`
        TTBPS=`expr $TMBPS + $RMBPS`
#       echo "$1 TX $TMBPS Mbits/s RX $RMBPS Mbits/s TOT $TTBPS Mbits/s"
        echo "$TTBPS Mbits/s"
~~~

<hr>

## (실행 ./bwloop.sh enp0s8) : 1회 측정을 계속 호출

~~~shell
#!/bin/bash

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi

IF=$1

while true
do
        ./bw1.sh $1
done
~~~

### 실행 결과

~~~shell
$ ./bwloop.sh enp0s8<br/>
293 Mbits/s<br/>
241 Mbits/s<br/>
277 Mbits/s<br/>
279 Mbits/s<br/>
254 Mbits/s<br/>
292 Mbits/s<br/>
~~~

<hr>

# C 프로그래밍

## (bw.cpp)

~~~shell
#include <sys/types.h>
#include <ifaddrs.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/sockios.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <ctype.h>
#include <time.h>
#include <math.h>

typedef struct {
    char   ifname[20];
} ifbwinfo;

ifbwinfo ifbw[4];

int main(){
    struct ifaddrs *addrs,*tmp;
    int ifcnt = 0;
    int i;
    char path1[50], path2[50];
    FILE *file1, *file2, *file3, *file4;
    ifbwinfo *tmp2;
    struct sockaddr_in *sa;
    char addr[10];
    struct tm *d;
    time_t curr;

    getifaddrs(&addrs);
    tmp = addrs;
    tmp2 = ifbw;
    while (tmp)
    {
            if (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_INET &&
                strcmp(tmp->ifa_name, "lo")) {
                strcpy(tmp2->ifname, tmp->ifa_name);
                ifcnt++;
                tmp2++;
            }
            tmp = tmp->ifa_next;
    }
    freeifaddrs(addrs);

    tmp2 = ifbw;
    printf("---------------------------------------------\n");
    printf("Calculate Used Bandwidth on ");
    for (i=0; i<ifcnt; i++){
      printf("%s ", tmp2->ifname);
      tmp2++;
    }
    printf("\n---------------------------------------------\n");

    while (1) {
      tmp2 = ifbw;
      for (i=0; i<ifcnt; i++)
      {
          unsigned long tx_bytes_last, rx_bytes_last;
          unsigned long tx_bytes_now, rx_bytes_now;
          unsigned long diff_tx_bytes, diff_rx_bytes;
          unsigned long diff_total_bytes;

          double tx_in_mbips, rx_in_mbips, total_in_mbips;
          float tx_in_mbipsf, rx_in_mbipsf, total_in_mbipsf;

          sprintf(path1,"/sys/class/net/%s/statistics/tx_bytes", tmp2->ifname);
          sprintf(path2,"/sys/class/net/%s/statistics/rx_bytes", tmp2->ifname);
          file1 = fopen(path1, "r");
          file2 = fopen(path2, "r");
          fscanf(file1, "%lu", (unsigned long *)&tx_bytes_last);
          fscanf(file2, "%lu", (unsigned long *)&rx_bytes_last);
          sleep(1);
          file3 = fopen(path1, "r");
          file4 = fopen(path2, "r");
          fscanf(file3, "%lu", (unsigned long *)&tx_bytes_now);
          fscanf(file4, "%lu", (unsigned long *)&rx_bytes_now);

          fclose(file1);
          fclose(file2);
          fclose(file3);
          fclose(file4);

          diff_tx_bytes = tx_bytes_now - tx_bytes_last;
          diff_rx_bytes = rx_bytes_now - rx_bytes_last;
          diff_total_bytes = diff_tx_bytes + diff_rx_bytes;

          tx_in_mbips = (double)((diff_tx_bytes * 8) / (1024*1024)) +
              (((diff_tx_bytes * 8) % (1024*1024))*0.000001);
          rx_in_mbips = (double)((diff_rx_bytes * 8) / (1024*1024)) +
              (((diff_rx_bytes * 8) % (1024*1024))*0.000001);
          total_in_mbips = (double)((diff_total_bytes * 8) / (1024*1024)) +
              (((diff_total_bytes * 8) % (1024*1024))*0.000001);

          tx_in_mbipsf = (float)tx_in_mbips;
          rx_in_mbipsf = (float)rx_in_mbips;
          total_in_mbipsf = (float)total_in_mbips;

          curr = time(NULL);
          d = localtime(&curr);

		      // ctime(d) to print timeStamp
          printf("%s: tx %.6f Mbits/sec rx %.6f Mbits/sec total %.6f Mbits/sec\n",
              tmp2->ifname, tx_in_mbipsf, rx_in_mbipsf, total_in_mbipsf);
          tmp2++;
      }
      printf("\n");
    }

    return 0;
}
~~~


### (컴파일 & 실행)

~~~shell
$ g++ bw.cpp -o bw
$ ./bw

Calculate Used Bandwidth on enp0s3 enp0s8 enp0s9 enp0s10

enp0s3: tx 4087.99634 Mbits/sec rx 4.00798 Mbits/sec total 4092.00415 Mbits/sec

enp0s8: tx 2513.61548 Mbits/sec rx 2.73904 Mbits/sec total 2516.35449 Mbits/sec

enp0s9: tx 1700.78943 Mbits/sec rx 1.62851 Mbits/sec total 1702.41797 Mbits/sec

enp0s10: tx 1373.33081 Mbits/sec rx 1.33254 Mbits/sec total 1374.66345 Mbits/sec



enp0s3: tx 3162.38501 Mbits/sec rx 2.44135 Mbits/sec total 3164.82642 Mbits/sec

enp0s8: tx 2864.00391 Mbits/sec rx 2.88768 Mbits/sec total 2866.89160 Mbits/sec

enp0s9: tx 2665.40356 Mbits/sec rx 2.70115 Mbits/sec total 2668.10474 Mbits/sec

enp0s10: tx 2755.54102 Mbits/sec rx 3.05213 Mbits/sec total 2758.59326 Mbits/sec
~~~

<hr>

# 리눅스 명령어

## (리눅스 명령어로 확인 방법)

~~~shell
$ cd /sys/class/net
$ ls

enp0s10  enp0s3  enp0s8  enp0s9  lo
~~~

~~~shell
$ cd enp0s3
$ ls

addr_assign_type  device    gro_flush_timeout  name_assign_type  power       tx_queue_len<br/>

address           dev_id    ifalias            netdev_group      proto_down  type

addr_len          dev_port  ifindex            operstate         queues      uevent

broadcast         dormant   iflink             phys_port_id      speed

carrier           duplex    link_mode          phys_port_name    statistics

carrier_changes   flags     mtu                phys_switch_id    subsystem
~~~

~~~shell
$ cd statistics/
$ ls

collisions     rx_dropped        rx_missed_errors   tx_bytes           tx_fifo_errors

multicast      rx_errors         rx_nohandler       tx_carrier_errors  tx_heartbeat_errors

rx_bytes       rx_fifo_errors    rx_over_errors     tx_compressed      tx_packets

rx_compressed  rx_frame_errors   rx_packets         tx_dropped         tx_window_errors

rx_crc_errors  rx_length_errors  tx_aborted_errors  tx_errors
~~~

~~~shell
$ cat tx_bytes

7727659228
~~~

