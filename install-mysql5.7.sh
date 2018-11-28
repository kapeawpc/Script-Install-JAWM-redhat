#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "install-mysql5.7..."

#Add repo
rpm -Uvh https://repo.mysql.com/mysql57-community-release-el7-11.noarch.rpm

#Install
yes Y | yum install mysql-community-server 

#Start service
systemctl start mysqld.service

#Show password
grep "A temporary password" /var/log/mysqld.log

#Chang password: example: P@ss0rd2018
#mysql_secure_installation

#Restart service 
#systemctl restart mysqld.service

#Enable service to auto start
systemctl enable mysqld.service

#Show status service
systemctl status mysqld.service
