#!/bin/bash

pingout=$(ping -c 1 -Q 1 -t 1 192.168.1.1)
check="Network is unreachable"

if [[ "$check" ==  "*$pingout"* ]]; then
	ifconfig wlo1 down
	sleep 2
	ifconfig wlo1 up
fi