Vagrant + Ansible => Kubernetes
==============================================

## Purpose
provision the kubernetes servers by using asnible

### Servers
- 192.168.33.2 master
- 192.168.33.3 worker
- 192.168.33.4 worker

with username `vagrant` and password `vagrant`

## Steps
- Provision servers
- Step1: Using ansible
  - cd ansible
  - `ansible -i hosts -m ping all -uroot -k`
  - using `ansible-playbook -i hosts playbook.yml -uroot -k` to initialize the kubernetes cluster
  - using `ansible-playbook -i hosts worker-join-playbook.yml -uroot -k` to join the worker nodes


## Tests
- Deploy nginx to cluster
  - `kubectl create deploy nginx --image=nginx`
  - `kubectl expose deploy nginx --port 80 --type NodePort`
  
    ```
    root@node1:/home/vagrant# kubectl get svc
    
    NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
    kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP        3h39m
    nginx        NodePort    10.96.157.45   <none>        80:31421/TCP   6s
    ```

    visit url: http://192.168.33.2:31421

**Notes**

- How to using the `ansible.cfg` in current folder

  - `export ANSIBLE_CONFIG=<PATH_TO_FILE>`

- How to config default ssh username/password

  - in `hosts`

    ```
    [all:vars]
    ansible_connection=ssh
    ansible_user=ubuntu
    ansible_pass=123456
    ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
    ```

  - in `ansible.cfg`
 
## Concepts
- 管理机
  - 任何安装了 Ansbile 的服务器，你都可以使用 ansible or ansible-playbook 命令
- 受控节点
  - Ansbile 管理的服务器或者网络设备都称为受控节点。 受控节点有时候也叫做 “hosts” ( 主机 ). 受控节点不需要安装 Ansible.
- Inventory 仓库
  - Inventory 仓库是保存受控节点信息的列表, 因为有时候也叫 “hostfile”， 类似于系统的 hosts 文件。
- Modules 模块
  - Modules 模块是 Ansible 执行代码的最小单元。 每个模块都是特殊用途，从特殊类型的数据库用户管理，到特殊类型的网络设备 VLAN 接口管理。 你可以在通过执行单个任务调用一个模块，也可以通过 playbook 同时调用执行钓具模块。 
- Tasks 任务
  - Ansible 执行操作的最小单位。 ad-hoc 更适合临时执行命令的执行场景。
- Playbooks 任务剧本
  - Playbooks 是任务列表的组合，通常会把常用的命令列表通过正确的语法写入到 playbook中。 Playbook 可以像普通 tasks 一样调用变量， 其使用 YAML 语法，便于读、写、分享、理解。

### Ansible Roles

**folder structures description**

- **`defaults`**: This directory lets you set default variables for included or dependent roles. Any defaults set here can be overridden in playbooks or inventory files.
- **`files`**: This directory contains static files and script files that might be copied to or executed on a remote server.
- **`handlers`**: All handlers that were in your playbook previously can now be added into this directory.
- **`meta`**: This directory is reserved for role metadata, typically used for dependency management.. For example, you can define a list of roles that must be applied before the current role is invoked.
- **`templates`**: This directory is reserved for templates that will generate files on remote hosts. Templates typically use variables defined on files located in the `vars` directory, and on host information that is collected at runtime.
- **`tasks`**: This directory contains one or more files with tasks that would normally be defined in the `tasks` section of a regular Ansible playbook. These tasks can directly reference files and templates contained in their respective directories within the role, without the need to provide a full path to the file.
- **`vars`**: Variables for a role can be specified in files inside this directory and then referenced elsewhere in a role.
