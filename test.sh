#!/bin/bash

result=`ip route | grep 192.168.200.6`
echo "print $result"
