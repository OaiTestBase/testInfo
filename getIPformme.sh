#!/bin/sh
screen -d -m -S HSS ping $hss_Hss
screen -d -m -S SPGW ping $spgw_S11
echo "hss ip ="$hss_Hss > ipHSS.txt
echo "spgw ip ="$spgw_S11 > ipspgw.txt
