#!/bin/bash
#change host name
sudo sed -i "s/ubuntu/$hostname/" /etc/hosts

#get interface for s11/s1
#$1 --> public ip
#$2 --> MME S11 ip
#S3 --> spgw s11 ip
S1Interface=`ifconfig | grep -B1 "inet addr:$1" | awk '$1!="inet" && $1!="--" {print $1}'`
S11Interface=`ifconfig | grep -B1 "inet addr:$2" | awk '$1!="inet" && $1!="--" {print $1}'`
echo S1Interface > ~/result.txt

#mod mme.conf
#S1 ip on mme
#sudo sed -i "s/__MME_S1_C_IP__/$1/" /opt/openbaton/scripts/OpenBaton/scripts/mme.conf
#S1 interface on mme
#sudo sed -i "s/__MME_S1_C_INTERFACE__/${S1Interface}/" /opt/openbaton/scripts/OpenBaton/scripts/mme.conf

#S11 ip on mme
#sudo sed -i "s/__MME_S11_C_IP__/$2/" /opt/openbaton/scripts/OpenBaton/scripts/mme.conf
#S11 interface on mme
#sudo sed -i "s/__MME_S11_C_INTERFACE__/${S11Interface}/" /opt/openbaton/scripts/OpenBaton/scripts/mme.conf
 
#SPGW ip on spgw
#sudo sed -i "s/SPGW_PRIVATE_IP/$3/" /opt/openbaton/scripts/OpenBaton/scripts/mme.conf
