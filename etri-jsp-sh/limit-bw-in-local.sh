#!/bin/bash

sudo tc qdisc add dev enp0s8 root handle 1:0 tbf rate 900Mbit burst 500k latency 1ms
sudo tc qdisc add dev enp0s9 root handle 1:0 tbf rate 900Mbit burst 500k latency 1ms
