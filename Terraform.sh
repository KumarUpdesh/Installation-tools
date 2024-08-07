#!/bin/bash

echo "Terraform installation started here .........."

sudo apt-get update -y

sudo apt-get install -y wget unzip

wget https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip


unzip terraform_0.15.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/

echo "=============================================================="
echo "Here is you terraform version"
terraform -v

echo "=============================================================="

# Check if a directory name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-name>"
  exit 1
fi

# Create the directory
mkdir -p "$1"

# Check if the directory was created successfully
if [ $? -eq 0 ]; then
  # Change to the new directory
  cd "$1"
  echo "Changed directory to $(pwd)"
else
  echo "Failed to create directory"
  exit 1
fi



#mkdir my-terraform-project
#cd my-terraform-project
