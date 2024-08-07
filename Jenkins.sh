#!/bin/bash

echo "Your jenkins installation has been started ............."

sudo apt update
sudo apt upgrade -y

sudo apt install openjdk-11-jdk -y

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins

#sudo ufw allow 8080
#sudo ufw status

"""
Access Jenkins:
Open a web browser and navigate to http://your_server_ip_or_domain:8080.

Unlock Jenkins:
Retrieve the initial admin password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


"""
