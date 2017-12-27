#!/bin/sh

#sudo su

#change hosts 
sudo cp /etc/hosts hosts
sudo cp /etc/hosts /etc/hosts_tmp
sudo sed -i 's/ubuntu/hss/' hosts > /etc/hosts

echo "bbbb"

#change host name without reboot
sudo hostname hss

echo "aaaa"
#change host name
sudo cp /etc/hostname hostname
sudo cp /etc/hostname /etc/hostname_tmp
sudo echo 'hss' > /etc/hostname

echo "cccc"
sudo cp hss.conf /usr/local/etc/oai
sudo cp hss_fd.conf /usr/local/etc/oai/freeDiameter
#sudo cp acl.conf /usr/local/etc/oai/freeDiameter
#sudo cp HSS.service /etc/systemd/system
#sudo ./create_db.sh
#sudo service HSS start
