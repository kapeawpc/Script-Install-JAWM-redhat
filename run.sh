#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "run all script...."

./install-java-8.sh &&
./install-apache2.4.sh &&
./install-wildfly.sh &&
./install-mysql5.7.sh
