#!/bin/sh
pass=`echo 'linux'` 
echo $pass > 111111111.txt
mysql -u root -p"$pass" -e 'CREATE DATABASE IF NOT EXISTS oai_db;'
echo $pass > 222222222.txt
mysql -u root -p"$pass" oai_db < /opt/openbaton/scripts/oai_db.sql
echo $pass > 333333333.txt
