#!/bin/bash
# interface enp0s8 connect

INTERVAL="1"  # update interval in seconds

IF=$1

while true
do
        wget ftp://user:1@192.168.10.2/file1
        cp file1 /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file2
        cp file2 /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file3
        cp file3 /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/
	sleep $INTERVAL
        wget ftp://user:1@192.168.10.2/file4
        cp file4 /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/
        sleep $INTERVAL
        rm /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/file1.*
        rm /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/file2.*
        rm /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/file3.*
        rm /home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/file4.*
	sleep $INTERVAL
done
