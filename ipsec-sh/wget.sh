#!/bin/bash
# interface enp0s8 connect

INTERVAL="1"  # update interval in seconds

IF=$1

while true
do
        wget ftp://user:1@192.168.10.2/file1 
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file2
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file3
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file4
        sleep $INTERVAL
        rm file1.*
        rm file2.*
        rm file3.*
        rm file4.*
	sleep $INTERVAL
done
