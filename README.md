Kubernetes学习环境
===================

- k8s-centos: 基于Vagrant Centos7 Box的k8s环境
- k8s-ubuntu: 基于Vagrant Ubuntu Box的k8s环境
- docs:  学习Kubernetes的相关资料及笔记
- deployments: k8s的一些部署yaml文件


通过`vagrant ssh kmaster`命令进入master，然后执行下面的命令，就可以正常使用`kubectl`(在provision的时候已经设置了，但是不知道为什么不起作用)

```
mkdir -p $HOME/.kube && \
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && \
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### 部署Kubernetes Dashboard

执行下面命令部署dashboard

```
kubectl apply -f /vagrant/addons/dashboard.yaml
```

访问

https://172.42.42.100:30001/

生成dashboard token

```
cd /vagrant/addons
./dashboard_token.sh
```

