#!/bin/bash
# config hss ip for mme
#mod mme.conf
#S1 ip on mme
sudo sed -i "s/__HSS_PRIVATE_IP__/${hss_Hss}/" /opt/openbaton/scripts/mme_fd.conf
