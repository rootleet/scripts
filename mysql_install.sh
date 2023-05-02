#!/bin/bash

# Install MySQL Server
sudo apt-get update
sudo apt-get install mysql-server -y

# Start MySQL Server
sudo systemctl start mysql

# Secure MySQL installation
sudo mysql_secure_installation

# Configure MySQL
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Sunderland@411';
CREATE USER 'anton'@'%' IDENTIFIED BY '258963';
GRANT ALL PRIVILEGES ON *.* TO 'anton'@'%';
FLUSH PRIVILEGES;
EOF

# Restart MySQL Server
sudo systemctl restart mysql
