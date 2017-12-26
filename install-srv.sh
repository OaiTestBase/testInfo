#!/bin/bash

sleep 10
screen -d -m -S server iperf -s
screen -d -m -S P1 ping $life
