Deploy Ceph Cluster in Kubernetes
======================================

```
git clone https://github.com/rook/rook.git
git checkout release-1.7
cd rook/cluster/examples/kubernetes/ceph

kubectl create -f crds.yaml -f common.yaml -f operator.yaml
kubectl create -f cluster.yaml
```

Deploy StorageClass
```
kubectl apply -f ./csi/rbd/storageclass.yaml

```

or Helm
```
helm repo add rook-release https://charts.rook.io/release
helm install --create-namespace --namespace rook-ceph rook-ceph-cluster \
   --set operatorNamespace=rook-ceph rook-release/rook-ceph-cluster -f values-override.yaml
```


Create pvc
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongo-pvc
spec:
  storageClassName: rook-ceph-block
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```