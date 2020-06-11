#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=172.42.42.100 --pod-network-cidr=192.168.0.0/16 --image-repository=registry.aliyuncs.com/google_containers

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to Vagrant user .kube directory"
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy flannel network
echo "[TASK 3] Deploy Calico network"
kubectl create -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml

# Generate Cluster join command
echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh
