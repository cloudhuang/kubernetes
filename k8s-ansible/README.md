Multipass + Ansible => Kubernetes
==============================================




## Purpose
provision the kubernetes servers by using asnible

### Servers
- node1 192.168.0.126
- node2 192.168.0.127
- node3 192.168.0.128

with username `ubuntu` and password `123456`

## Steps
- Provision servers
- Step1: Install ansible
- Step2: Hello World
  - config ssh
    ```
    
    ```
  - Where to store the ansible `hosts` file
    - While Ansible will try /etc/ansible/hosts by default, there are several ways to tell ansible where to look for an alternate inventory file:
      - use the `-i` command line switch and pass your inventory file path
      - add `inventory = path_to_hostfile` in the `[defaults]` section of your ~/.ansible.cfg configuration file
      - use `export ANSIBLE_HOSTS=path_to_hostfile` 



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
