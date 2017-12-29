#!/bin/sh

#change host name
sed -i "s/ubuntu/$hostname/" /etc/hosts
sed -i 's/$hostname/hss/' /etc/hosts
hostname hss

#change host name
sudo cp /etc/hostname /etc/hostname_tmp
ORGHNAME=`cat /etc/hostname`
echo "sed -i 's/$ORGHNAME/hss/' /etc/hostname" > mod_hostname.sh
sudo sh mod_hostname.sh

sudo cp /opt/openbaton/scripts/hss.conf /usr/local/etc/oai
sudo cp /opt/openbaton/scripts/hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp /opt/openbaton/scripts/acl.conf /usr/local/etc/oai/freeDiameter
sudo cp /opt/openbaton/scripts/HSS.service /etc/systemd/system
sudo sh create_db.sh
sudo service HSS start
