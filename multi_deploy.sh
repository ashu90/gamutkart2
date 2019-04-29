#!/bin/bash

for i in `cat multi-deploy-IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "ashu@123" scp target/gamutkart.war root@$i:/opt/software/apache-tomcat-8.5.39/webapps/
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "ashu@123" ssh root@$i "JAVA_HOME=/opt/software/jdk1.8.0_201" "/opt/software/apache-tomcat-8.5.39/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
