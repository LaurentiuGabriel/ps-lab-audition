# ps-lab-audition
## Introduction
In this lab we are leveraging Hydra's capabilities to launch a dictionary attack and force our way into the Globomantics network. 

## Prerequisites
### Running the Lab in the Cloud
This lab is configured to use AWS as a Cloud provider. You would need the following:
- Terraform needs to be installed.
- An AWS account.
The `main.tf` file needs to be changed as follows:
1. Region must be set to the one used by your account.
2. The tag needs to be changed to have a more meaningful name.
3. In the connection object, add the path to a private key, as well as the public IP of the machine you own in AWS.
4. Change the names of the security groups the match the ones you own in AWS.

Run the following commands to provision the machine:
1. `terraform init`
2. `terraform plan`
3. `terraform apply`

### Running the Lab locally
To run this lab locally, you need a machine running any version of Ubuntu. After setting up the machine, perform the following steps:
1. Run the `./sensitive-info.sh` script on the target machine.
2. Run the following commands on the target machine:
```
apt-get update

# Install Apache web server
apt-get install apache2 -y

# Install MySQL database server
apt-get install mysql-server -y

# Install PHP scripting language
apt-get install php -y

# Make the machine vulnerable by changing the password for the root user
echo "root:toor" | chpasswd

# Flush all existing firewall rules
iptables -F

# Allow incoming traffic to port 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Save the iptables rules
/sbin/iptables-save
```

## Learner Instructions
You will need to follow along in the Lab Instructions we've provided in this repo. They should be run against the Ubuntu machine you have set up.

Please feel free to reach out if you have any questions!
