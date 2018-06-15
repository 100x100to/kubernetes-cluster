#!/bin/bash

sudo apt-get -y install kubectl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install apt-transport-https docker.io kubelet kubeadm
sudo systemctl enable docker && sudo systemctl start docker
