#!/bin/bash

#change host name
ORGHNAME=`cat /etc/hostname`
sudo sed -i "s/ubuntu/$ORGHNAME/" /etc/hosts
sudo sed -i "s/$ORGHNAME/hss/" /etc/hosts
sudo sed -i "s/$ORGHNAME/hss/" /etc/hostname
sudo hostname hss

#start HSS
sudo cp ~/testInfo/hss.conf /usr/local/etc/oai
sudo cp ~/testInfo/hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/testInfo/acl.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/testInfo/HSS.service /etc/systemd/system
#sudo sh ~/testInfo/create_db.sh
#sudo service HSS start
