#!/bin/bash

result=`ifconfig | grep -B1 'inet addr:10.1.4.32' | awk '$1!="inet" && $1!="--" {print $1}'`
echo "123#$result#456"
sh test2.sh ${result}
exit 0
