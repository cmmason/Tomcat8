#!/bin/sh
 
# Created by: Christopher Mason - Product Engineering
# Purpose: Tomcat Post Installation Configuration

#Create tomcat user and group
groupadd tomcat
useradd -p saxGNITbDEZpo -g tomcat tomcat

#remove unneeded directories
rm -R /local/apps/tomcat/webapps/docs
rm -R /local/apps/tomcat/webapps/examples
rm -R /local/apps/tomcat/webapps/host-manager
rm -R /local/apps/tomcat/webapps/ROOT

#remove bat files
rm /local/apps/tomcat/bin/*.bat

#make webapps directory writeable
chmod 775 /local/apps/tomcat/webapps

#backup original server.xml file
mv /local/apps/tomcat/conf/server.xml /local/apps/tomcat/conf/server_orig.xml

#copy PLCM server.xml into conf directory
cp /local/apps/tomcat/post/server.xml /local/apps/tomcat/conf

#backup tomcat-users.xml
mv /local/apps/tomcat/conf/tomcat-users.xml /local/apps/tomcat/conf/tomcat-users_orig.xml

#copy PLCM tomcat-users.xml into conf directory
cp /local/apps/tomcat/post/tomcat-users.xml /local/apps/tomcat/conf

#change ownership for tomcat directory
chown -R tomcat:tomcat /local/apps/tomcat

#add tomcat environment variables to .bashrc
echo 'export CATALINA_BASE=/local/apps/tomcat' >> /home/tomcat/.bashrc
echo 'export JAVA_HOME=/local/apps/tomcat/java' >> /home/tomcat/.bashrc
echo 'export TOMCAT_USER=tomcat' >> /home/tomcat/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/tomcat/.bashrc

#start tomcat as tomcat user
su - tomcat -c /local/apps/tomcat/bin/startup.sh
