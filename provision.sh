#!/bin/bash

# Update packages
apt-get update

# Install Apache web server
apt-get install apache2 -y

# Install MySQL database server
apt-get install mysql-server -y

# Install PHP scripting language
apt-get install php -y

# Make the machine vulnerable by changing the password for the root user
echo "root:toor" | chpasswd