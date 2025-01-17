#!/bin/bash

# Set the path for the myrepo folder
REPO_DIR="/home/ec2-user/"
MAVEN_VERSION="3.9.9"
MAVEN_TAR="apache-maven-$MAVEN_VERSION-bin.tar.gz"
MAVEN_URL="https://downloads.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/$MAVEN_TAR"

# Ensure the directory exists
if [ ! -d "$REPO_DIR" ]; then
  echo "The directory $REPO_DIR does not exist. Exiting."
  exit 1
fi

# Navigate to the myrepo directory
cd $REPO_DIR

# Download Maven binary
echo "Downloading Maven $MAVEN_VERSION..."
wget $MAVEN_URL

# Extract the downloaded tar.gz file
echo "Extracting Maven..."
tar -xvzf $MAVEN_TAR

# Set up Maven environment variables
echo "Setting up Maven environment variables..."
echo "export MAVEN_HOME=$REPO_DIR/apache-maven-$MAVEN_VERSION" >> ~/.bash_profile
echo "export PATH=\$MAVEN_HOME/bin:\$PATH" >> ~/.bash_profile

# Apply the changes
source ~/.bash_profile

# Verify Maven installation
echo "Verifying Maven installation..."
mvn -version

# Clean up the downloaded tar.gz file
echo "Cleaning up..."
rm -f $MAVEN_TAR

echo "Maven $MAVEN_VERSION installed successfully in $REPO_DIR!"
