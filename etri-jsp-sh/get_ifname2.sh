#!/bin/bash
 
IP="$1"
IF=$(ip addr | grep -B2 "inet $IP" | awk '$1!="link/ether" && $1!="inet" {print $2;}')
IF=${IF%:*}
echo $IF
