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
cp HSS.service /etc/systemd/system
#./create_db.sh
#service HSS start
