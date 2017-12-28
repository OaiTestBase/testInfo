#!/bin/bash
sudo apt install screen
screen -d -m -S anyone ping 8.8.8.8
screen -d -m -S HSS ping $hss_Hss
screen -d -m -S SPGW ping $spgw_S11
screen -d -m -S anytwo ping 9.9.9.9
#echo "hss ip ="$hss_Hss > ipHSS.txt
#echo "spgw ip ="$spgw_S11 > ipspgw.txt
