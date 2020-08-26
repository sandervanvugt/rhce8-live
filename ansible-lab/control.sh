#!/bin/sh
echo "Control Node Preparation ..."
yum update -y
yum install -y epel-release
yum install -y python3 ansible git bind-utils vim bash-completion

PASS=$(echo "ansible" | openssl passwd -1 -stdin)
useradd -p "$PASS" ansible
cat <<EOF > /etc/sudoers.d/ansible
ansible	ALL=NOPASSWD: ALL
EOF

cat <<EOF >> /etc/hosts
192.168.4.200 control.example.com
192.168.4.201 ansible1.example.com
192.168.4.202 ansible2.example.com
EOF

su - ansible -c "ssh-keygen -b 2048 -t rsa -f /home/ansible/.ssh/id_rsa -q -P \"\""
su - ansible -c "ssh-keyscan ansible1.example.com 2>/dev/null >> home/ansible/.ssh/known_hosts"
su - ansible -c "ssh-keyscan ansible2.example.com 2>/dev/null >> home/ansible/.ssh/known_hosts"
su - ansible -c "echo 'ansible' | sshpass ssh-copy-id -f -i /home/ansible/.ssh/id_rsa.pub -o StrictHostKeyChecking=no ansible@ansible1.example.com"
su - ansible -c "echo 'ansible' | sshpass ssh-copy-id -f -i /home/ansible/.ssh/id_rsa.pub -o StrictHostKeyChecking=no ansible@ansible2.example.com"

su - ansible -c "git clone https://github.com/sandervanvugt/rhce8-live.git"