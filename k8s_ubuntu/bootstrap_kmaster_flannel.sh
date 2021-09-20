echo "[TASK 1] Pull required containers"
kubeadm config images pull --kubernetes-version v1.20.8 --image-repository=registry.aliyuncs.com/google_containers >/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=10.244.0.0/16 --kubernetes-version=v1.20.8 --image-repository=registry.aliyuncs.com/google_containers >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
echo "[TASK 3] Copy kube admin config to Vagrant user .kube directory"
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy flannel network
echo "[TASK 4] Deploy flannel network"
kubectl create -f /vagrant/addons/kube-flannel.yaml

# Generate Cluster join command
echo "[TASK 5] Generate and save cluster join command to /joincluster.sh"
sudo kubeadm token create --print-join-command > /joincluster.sh
