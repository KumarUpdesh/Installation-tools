#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Install Java
echo "Installing Java..."
sudo apt install openjdk-11-jdk -y

# Add Jenkins repository and key
echo "Adding Jenkins repository and key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index
echo "Updating package index..."
sudo apt update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install jenkins -y

# Start and enable Jenkins service
echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Adjust firewall
echo "Adjusting firewall to allow port 8080..."
sudo ufw allow 8080
sudo ufw reload

# Retrieve initial admin password
echo "Jenkins installed successfully!"
echo "To unlock Jenkins, use the following initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo ""
echo "Access Jenkins at http://your_server_ip_or_domain:8080"

# Script end
echo "Installation script completed."
