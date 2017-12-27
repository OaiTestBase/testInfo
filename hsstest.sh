#!/bin/sh
sudo su
hostname hss

echo -e "127.0.0.1       localhost
127.0.1.1       hss

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
" > /etc/host

cp hss.conf /usr/local/etc/oai
cp hss_fd.conf /usr/local/etc/oai/freeDiameter
cp acl.conf /usr/local/etc/oai/freeDiameter
cp oai_db.sql /tmp
cp create_db.sh /tmp
./create_db.sh
/root/openair-cn/SCRIPTS/run_hss


