#!/bin/sh

#sudo su

#change hosts 
sudo cp /etc/hosts hosts
sudo cp /etc/hosts /etc/hosts_tmp
sudo sed -i 's/ubuntu/hss/' /etc/hosts


#change host name without reboot
sudo hostname hss

#change host name
sudo cp /etc/hostname /etc/hostname_tmp
ORGHNAME=`cat /etc/hostname`
echo "sed -i 's/$ORGHNAME/hss/' /etc/hostname" > mod_hostname.sh
sudo sh mod_hostname.sh

sudo cp hss.conf /usr/local/etc/oai
sudo cp hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp acl.conf /usr/local/etc/oai/freeDiameter
sudo cp HSS.service /etc/systemd/system
sudo sh create_db.sh
sudo service HSS start
