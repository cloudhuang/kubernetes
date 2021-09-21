### Deploy
```
kustomize build . | kubectl apply -f -
```

### Undeploy
```
kustomize build . | kubectl delete -f -
```

```
$ kubectl get pod -n kube-ops    
NAME                         READY   STATUS    RESTARTS   AGE
gitlab-56ffb5fffd-czng7      1/1     Running   1          9m15s
postgresql-dcc697b6d-lbgwh   1/1     Running   1          9m15s
redis-8678b49d6f-vw46p       1/1     Running   0          9m15s

kubectl port-forward gitlab-56ffb5fffd-czng7 8080:80 -n kube-ops
```

username: root
password: admin1234