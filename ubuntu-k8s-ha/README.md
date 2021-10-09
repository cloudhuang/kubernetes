

## Start
```
vagrant up
```

## ansible connect
```
$ ansible -i hosts -m ping all -uroot -k
$ SSH password: kubeadmin
```

## ansible playbook
```
$ ansible-playbook -i hosts playbook.yml -uroot -k
$ SSH password: kubeadmin
```

### HAProxy Stats UI
http://172.16.16.51:8404/haproxy?stats

## Snapshot
```
vagrant snapshot push

vagrant snapshot pop [--no-delete] [--no-provision]
```