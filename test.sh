#!/bin/bash

result='ifconfig | grep -B1 "inet addr:192.168.200.6"'
#awk '$1!="inet" && $1!="--" {print $1}'
echo "123#$result#456"
