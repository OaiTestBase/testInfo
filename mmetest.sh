#!/bin/sh

#test code
cp mme.conf mme_tmp.conf
S1_MME="10.1.4.7"
S11="10.1.1.7"
SPGW_S11="10.1.1.8"
hss_HSS="10.1.2.2"


#get interface for s11/s1
S1Interface=ifconfig | grep -B1 "inet addr:${S1_MME}" | awk '$1!="inet" && $1!="--" {print $1}'
S11Interface=ifconfig | grep -B1 "inet addr:${S11}" | awk '$1!="inet" && $1!="--" {print $1}'

#mod mme.conf
#S1 ip
sed -i "s/__MME_S1_C_IP__/${S1_MME}/" mme.conf
#S1 interface
sed -i "s/__MME_S1_C_INTERFACE__/${S1Interface}/" mme.conf

#S11 ip
sed -i "s/__MME_S1_C_IP__/${S11}/" mme.conf
#S11 interface
sed -i "s/__MME_S1_C_INTERFACE__/${S11Interface}/" mme.conf
 
 #SPGW ip
sed -i "s/SPGW_PRIVATE_IP/${SPGW_S11}/" mme.conf

#mod mme_fd.conf
#HSS ip
sed -i "s/HSS_PRIVATE_IP/${hss_HSS}/" mme.conf

