#!/bin/bash
# Script to Install JAVA 8 (JDK 8u40) on CentOS/RHEL 7/6/5 and Fedora
# http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "Installing Java 8...."

cd /tmp/

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz

cp jdk-8u191-linux-x64.tar.gz /usr/java

cd /usr/java && tar -vxzf jdk-8u191-linux-x64.tar.gz 

cd /usr/java/jdk1.8.0_191/ && rm -rf /usr/java/jdk-8u191-linux-x64.tar.gz

alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_191/bin/java 2
alternatives --config java

alternatives --install /usr/bin/jar jar /usr/java/jdk1.8.0_191/bin/jar 2
alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_191/bin/javac 2
alternatives --set jar /usr/java/jdk1.8.0_191/bin/jar
alternatives --set javac /usr/java/jdk1.8.0_191/bin/javac

export JAVA_HOME=/usr/java/jdk1.8.0_191
echo %JAVA_HOME
java -version

