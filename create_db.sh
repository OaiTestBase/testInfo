#!/bin/sh

mysql -u root -plinux -e 'CREATE DATABASE IF NOT EXISTS oai_db;'
mysql -u root -plinux oai_db < oai_db.sql
