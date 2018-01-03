#!/bin/bash
# config hss ip for mme
#mod mme.conf
#S1 ip on mme
sudo sed -i "s/__HSS_PRIVATE_IP__/${hss_Hss}/" /opt/openbaton/scripts/mme_fd.conf

#change host name
ORGHNAME=`cat /etc/hostname`
sed -i "s/$ORGHNAME/nano/" /etc/hosts
sed -i "s/$ORGHNAME/nano/" /etc/hostname
hostname nano

#start MME service
while :
do
    ResultForHss3868=`nmap -p 3868 ${hss_Hss} | grep open`
    ResultForHss5868=`nmap -p 5868 ${hss_Hss} | grep open`
    if [ "X$ResultForHss3868" = "X" ] || [ "X$ResultForHss5868" = "X" ]; then
        echo "wait for HSS"
    else
        echo "HSS is alread up"
        break
    fi
    echo "\n still in loop and sleep 1 sec ~"
    sleep 1
done
echo "done" > /opt/openbaton/scripts/mme_YOYO.txt

#sudo service MME start
