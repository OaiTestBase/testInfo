#!/bin/bash

# echo $new_key > /home/ubuntu/config

screen -d -m -S client iperf -c $server_private2 -t 480
echo "Hostname: $hostname"
echo "life IP: $life"
