# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >> /etc/hosts<<EOF
172.42.42.100 ansible.example.com ansible
172.42.42.101 node1.example.com node1
172.42.42.102 node2.example.com node2
172.42.42.103 node3.example.com node3
EOF
