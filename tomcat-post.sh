
#!/bin/sh
 
# Created by: Christopher Mason - Product Engineering
# Purpose: Tomcat Post Installation Configuration

#Create tomcat user and group
groupadd tomcat
useradd -s /sbin/nologin -g tomcat -d /local/apps/tomcat tomcat
passwd tomcat

#remove unneeded directories
rm -R /local/apps/tomcat/webapps/docs
rm -R /local/apps/tomcat/webapps/examples
rm -R /local/apps/tomcat/webapps/host-manager
rm -R /local/apps/tomcat/webapps/ROOT

#change ownership for tomcat directory
chown -R tomcat:tomcat /local/apps/tomcat

#make webapps directory writeable
chmod 775 /local/apps/tomcat/webapps

#backup original server.xml file
mv /local/apps/tomcat/conf/server.xml /local/apps/tomcat/conf/server_orig.xml

#copy PLCM server.xml into conf directory
cp /local/apps/tomcat/post/server.xml /local/apps/tomcat/conf

#copy tomcat script to init.d
cp /local/apps/tomcat/post/tomcat /etc/init.d

#start tomcat
su tomcat -c /etc/init.d/tomcat start

