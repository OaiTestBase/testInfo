#!/bin/bash

screen -d -m -S HOPE ping 8.8.8.8
screen -d -m -S giveup ping $whywhy_Hss
screen -d -m -S REALLIFE ping 9.9.9.9
#if [ $server_shared_int_network_floatingIp ]
#then
#    screen -d -m -S client iperf -c $server_shared_int_network_floatingIp -t 300
#else
#    screen -d -m -S client iperf -c $server_private_floatingIp -t 300
#fi
