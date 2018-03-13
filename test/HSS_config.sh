#!/bin/bash

#change host name
ORGHNAME=`cat /etc/hostname`
sed -i "s/ubuntu/$ORGHNAME/" /etc/hosts
sed -i "s/$ORGHNAME/hss/" /etc/hosts
sed -i "s/$ORGHNAME/hss/" /etc/hostname
hostname hss

#start HSS
sudo cp ~/testInfo/test/hss.conf /usr/local/etc/oai
sudo cp ~/testInfo/test/hss_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/testInfo/test/acl.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/testInfo/test/HSS.service /etc/systemd/system
sudo sh ~/testInfo/test/create_db.sh
sudo service HSS start
