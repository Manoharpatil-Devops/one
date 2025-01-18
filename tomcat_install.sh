wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz
tar -xvzf apache-tomcat-9.0.98.tar.gz
cd apache-tomcat-9.0.98/webapps/manager/META-INF/
sed -i 21d context.xml
sed -i 22d context.xml
cd /home/ec2-user/one/apache-tomcat-9.0.98/conf/
sed -n '50,52p' tomcat-users.xml | sed -i '55r /dev/stdin' tomcat-users.xml
sed -i '56s/tomcat/manager-gui/;57s/role1/manager-script/' tomcat-users.xml
sed -i '58s/<must-be-changed>/1234/;58s/roles="tomcat"/roles="manager-gui, manager-script"/' tomcat-users.xml
cd ../bin/
bash startup.sh
