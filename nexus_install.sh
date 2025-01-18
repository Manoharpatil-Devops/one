yum install java-17-amazon-corretto-jmods -y
mkdir /app
cd /app
sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xvzf nexus.tar.gz
mv nexus-3* nexus
adduser nexus
chown -R nexus:nexus /app/nexus
chown -R nexus:nexus /app/sonatype-work
cd nexus/
cd bin/
sed -i 's/run_as_user=""/run_as_user="nexus"/' nexus.rc
touch /etc/systemd/system/nexus.service
