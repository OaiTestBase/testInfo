#!/bin/bash
pass=`echo 'linux'` 
mysql -u root -p"$pass" -e 'CREATE DATABASE IF NOT EXISTS oai_db;'
mysql -u root -p"$pass" oai_db < /opt/openbaton/scripts/oai_db.sql
