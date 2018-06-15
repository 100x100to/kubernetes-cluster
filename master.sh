#!/bin/bash

sudo apt-get -y install kubectl
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 >> cluster_initialized.txt
mkdir $HOME/.kube
chmod 0755 $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml >> pod_network_setup.txt
