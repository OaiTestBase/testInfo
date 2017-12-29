#!/bin/bash
# config hss ip for mme
#test code
sed -i "s/ubuntu/$hostname/" /etc/hosts

#get interface for s11/s1
S1Interface=`ifconfig | grep -B1 "inet addr:${S1_MME}" | awk '$1!="inet" && $1!="--" {print $1}'`
S11Interface=`ifconfig | grep -B1 "inet addr:${S11}" | awk '$1!="inet" && $1!="--" {print $1}'`

echo "s1 intf = ${S1Interface}"
echo "s11 intf = ${S11Interface}"
#mod mme.conf
#S1 ip on mme
sed -i "s/__MME_S1_C_IP__/${S1_MME}/" mme.conf
#S1 interface on mme
sed -i "s/__MME_S1_C_INTERFACE__/${S1Interface}/" mme.conf

#S11 ip on mme
sed -i "s/__MME_S11_C_IP__/${S11}/" mme.conf
#S11 interface on mme
sed -i "s/__MME_S11_C_INTERFACE__/${S11Interface}/" mme.conf
 
#SPGW ip on spgw
sed -i "s/SPGW_PRIVATE_IP/${spgw_S11}/" mme.conf
