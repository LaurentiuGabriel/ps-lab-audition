#!/bin/bash

# Generate sample sensitive information
password=$(date | md5sum | head -c 8)
secret_key=$(uuidgen | head -c 16)

# Store sensitive information in a file
echo "Password: $password" > sensitive-info.txt
echo "Secret Key: $secret_key" >> sensitive-info.txt

# Set permissions for sensitive-info.txt
chmod 400 sensitive-info.txt