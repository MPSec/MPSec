#!/bin/bash
 
IP="$1"
IF=$(ifconfig | grep -B1 "inet $IP" | awk '$1!="inet" && $1!="--" {print $1;}')
IF=${IF%:*}
echo $IF
