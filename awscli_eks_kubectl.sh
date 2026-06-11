#!/bin/bash

echo "Updating system..."
sudo apt update -y
sudo apt updrage -y

echo "Installing prerequisites..."
sudo apt install -y curl unzip tar

echo "Installing AWS CLI v2..."
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install

echo "Installing kubectl..."
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "Installing eksctl..."
curl --silent --location \
"https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" \
| tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

echo "Verifying installations..."
echo "--------------------------------"

aws --version

kubectl version --client

eksctl version

echo "--------------------------------"
echo "Installation completed successfully."

#cluster creation command
#eksctl create cluster --name tokyo --region us-east-1 --nodegroup-name japan --nodes 2 --node-type t3.small

#cluster deletion command
#eksctl delete cluster --name tokyo --region us-east-1


