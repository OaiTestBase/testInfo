#!/bin/sh

sudo su
#change host name
cp /etc/hostname hostname
cp /etc/hostname /etc/hostname_tmp
echo 'hss' > /etc/hostname

#change hosts 
cp /etc/hosts hosts
cp /etc/hosts /etc/hosts_tmp
sed 's/ubuntu/hss/' hosts > /etc/hosts

#change host name without reboot
sudo hostname hss

#sudo cp hss.conf /usr/local/etc/oai
#sudo cp hss_fd.conf /usr/local/etc/oai/freeDiameter
#sudo cp acl.conf /usr/local/etc/oai/freeDiameter
#sudo cp HSS.service /etc/systemd/system
#sudo ./create_db.sh
#sudo service HSS start
