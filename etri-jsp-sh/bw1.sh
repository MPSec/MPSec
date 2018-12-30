#!/bin/bash
# bwm3f.sh
# MBit/Sec, %.3f
# by bgjung@etri.re.kr

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface] [intval_sec]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi

IF=$1

if [ "$2" ]; then
        INTERVAL=`expr "$2"`
fi

# if loop uncomment 3 lines : while do end
#while true
#do
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        sleep $INTERVAL
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TMBPS=`expr $TBPS \* 8 / 1024 / 1024 / $INTERVAL`
        RMBPS=`expr $RBPS \* 8 / 1024 / 1024 / $INTERVAL`
        TMBPSF=`echo "${TMBPS} ${TBPS}" |
            awk '{printf "%.3f", $1 + ($2 * 8) % (1024*1024) * 0.000001}'`
        RMBPSF=`echo "${RMBPS} ${RBPS}" |
            awk '{printf "%.3f", $1 + ($2 * 8) % (1024*1024) * 0.000001}'`
        AMBPSF=`echo "${TMBPSF} ${RMBPSF}" | awk '{printf "%.3f", $1 + $2}'`
#       echo "$1 TX $TMBPS Mbits/s RX $RMBPS Mbits/s TOT $TTBPS Mbits/s"
        echo $AMBPSF
#done
