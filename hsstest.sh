#!/bin/sh
sudo su
hostname hss

#change host name
cp /etc/hostname hostname
mv /etc/hostname /etc/hostname_tmp
sed 's/ubuntu/hss/' hostname > /etc/hostname

#change hosts 
cp /etc/hosts hosts
mv /etc/hosts /etc/hosts_tmp
sed 's/ubuntu/hss/' hosts > /tmp/hosts

cp hss.conf /usr/local/etc/oai
cp hss_fd.conf /usr/local/etc/oai/freeDiameter
cp acl.conf /usr/local/etc/oai/freeDiameter
cp oai_db.sql /tmp
cp create_db.sh /tmp
#./create_db.sh
#/root/openair-cn/SCRIPTS/run_hss


