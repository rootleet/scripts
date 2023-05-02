#!/bin/bash

# Install SSH server
sudo apt update
sudo apt install -y openssh-server

# Configure SSH server
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config    # Change SSH port to 2222
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config    # Disable root login
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config    # Enable public key authentication
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config    # Disable password authentication
sudo service ssh restart

# Configure firewall
sudo apt install -y ufw
sudo ufw allow 2222/tcp
sudo ufw enable

# Generate SSH key pair for client machine
ssh-keygen -t rsa

echo "SSH server has been installed and configured successfully."
