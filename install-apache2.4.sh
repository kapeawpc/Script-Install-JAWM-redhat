#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "Installing apache httpd 2.4 ...."


#add repo

rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#check list yum list httpd
yum list httpd


#install httpd
yes Y| yum install httpd


#Check version
httpd -v


#start service
systemctl start httpd.service

#Enable service to auto start
systemctl status httpd.service

#Show status service
systemctl status httpd.service
