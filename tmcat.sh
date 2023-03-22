#!/bin/bash

#Welcome to TM TOMCAT INSTALLER
#This script is to install tomcat successfully
#This script will also install wget,git,nano,unzip,and java 1.8+
#Run this script after you launch your tomcat instance & connect it to your ssh client
#This script will also help you cd to the /opt directory before starting installations
#This script will also unzip your tar tomcat file for you
#This script will delete the unneeded tar file for you after unzipping/tarring the file to help you free up system space
#This script will also rename your tomcat file for you
#This script will also help you create soft links to start and stop tomcat
#After running the script, you can start tomcat with "sudo starttomcat" and kill it with "sudo stoptomcat"
#Ensure that you have java 1.8+ installed in your server before proceeding with this script (RUN THE JAVA -VERSION COMMAND TO CONFIRM YOUR JAVA VERSION)
#vi into this script using sudo command (sudo vi/vim/nano)

cd /opt
sudo yum install git wget unzip tree nano vim all -y
sudo yum install java-1.8.0-openjdk-devel -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
sudo tar -xvf apache-tomcat-9.0.73.tar.gz
sudo rm apache-tomcat-9.0.73.tar.gz
sudo mv apache-tomcat-9.0.73 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
#Creating softlink to start/stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "Magic is indeed from mars"
echo "Tomcat started"

