Deploy Kuberneate cluster by vagrant + ansible
=====================================================


```
vagrant up

ansible -i hosts -m ping all -uroot -k
ansible-play -i hosts playbook.yml -uroot -k
```
