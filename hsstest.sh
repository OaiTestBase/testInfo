#!/bin/sh
#change host name
sudo cp /etc/hostname hostname
sudo mv /etc/hostname /etc/hostname_tmp
sudo sed 's/ubuntu/hss/' hostname > /etc/hostname

#change hosts 
sudo cp /etc/hosts hosts
sudo mv /etc/hosts /etc/hosts_tmp
sudo sed 's/ubuntu/hss/' hosts > /tmp/hosts

#change host name without reboot
sudo hostname hss

sudo cp hss.conf /usr/local/etc/oai
sudo cp hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp acl.conf /usr/local/etc/oai/freeDiameter
sudo cp HSS.service /etc/systemd/system
sudo ./create_db.sh
sudo service HSS start
