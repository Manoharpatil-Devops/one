#!/bin/bash

# Update the system packages
echo "Updating system packages..."
sudo yum update -y

# Import Amazon Corretto GPG key
echo "Importing Amazon Corretto GPG key..."
sudo rpm --import https://yum.corretto.aws/corretto.key

# Add the Amazon Corretto repository
echo "Adding Amazon Corretto repository..."
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

# Install Amazon Corretto 17
echo "Installing Amazon Corretto 17..."
sudo yum install -y java-17-amazon-corretto-devel

# Configure Java 17 as the default version
echo "Configuring Java 17 as the default Java version..."
sudo alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-amazon-corretto/bin/java 1
sudo alternatives --config java <<EOF
1
EOF

# Verify the Java installation
echo "Verifying the Java version..."
java -version

