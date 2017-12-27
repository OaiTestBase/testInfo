#!/bin/sh
sudo su
#change host name
cp /etc/hostname hostname
mv /etc/hostname /etc/hostname_tmp
sed 's/ubuntu/hss/' hostname > /etc/hostname

#change hosts 
cp /etc/hosts hosts
mv /etc/hosts /etc/hosts_tmp
sed 's/ubuntu/hss/' hosts > /etc/hosts
exit

#change host name without reboot
sudo hostname hss

sudo cp hss.conf /usr/local/etc/oai
sudo cp hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp acl.conf /usr/local/etc/oai/freeDiameter
sudo cp HSS.service /etc/systemd/system
#sudo ./create_db.sh
#sudo service HSS start
