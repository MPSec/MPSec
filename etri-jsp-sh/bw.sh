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
