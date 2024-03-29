#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 23 May 2019,
# Description : ansible help.

# https://github.com/ansible/ansible-examples
# https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html
# https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html
# https://docs.ansible.com/ansible-lint/rules/default_rules.html

# installing ansible ansible-lint via pip.
pip install ansible ansible-lint

# upgrading pip via pip.
pip install --upgrade pip

# generate id_rsa and id_rsa.pub into $HOME/.ssh of ansible-controller.
# copy id_rsa.pub into authorized_keys of ansible-node(s).
ssh-keygen -q -N '' -m pem -t rsa -b 4096 -C balaji.pothula@techie.com

# runing a system command with out using module(s).
ansible -i "/home/ansible/Ansible/Tomcat" -a "/sbin/reboot" -f 10 -u ubuntu --become

ansible appservers -m ansible.builtin.copy -a "src=/home/ubuntu/tomcat.txt dest=/home/ubuntu/tomcat.txt"

ansible appservers -m ansible.builtin.file -a "dest=/home/tomcat/hello.txt mode=755 owner=tomcat group=tomcat"

ansible appservers -m ansible.builtin.file -a "dest=/home/tomcat/hello mode=755 owner=tomcat group=tomcat state=directory"

ansible appservers -m ansible.builtin.file -a "dest=/home/tomcat/hello state=absent"

ansible appservers -m ansible.builtin.yum -a "name=nginx state=present"
ansible appservers -m ansible.builtin.yum -a "name=nginx state=absent"
ansible appservers -m ansible.builtin.yum -a "name=nginx state=latest"

ansible all -m ansible.builtin.user -a "name=tomcat"

ansible appservers -m ansible.builtin.service -a "name=httpd state=started"
ansible appservers -m ansible.builtin.service -a "name=httpd state=stopped"
ansible appservers -m ansible.builtin.service -a "name=httpd state=restarted"

ansible appservers -m git -a "repo=https://github.com/balajipothula/k8s.git dest=/home/tomcat/ version=HEAD"

# pinging host(s) where hosts inventory file in current working directory.
ansible -m ping all
ansible -m ping -i host-tomcat tomcat
ansible -m ping -i "/home/ansible/Ansible/Tomcat" tomcat --private-key="/home/ansible/Ansible/Tomcat.pem"
ansible -m ping -i "/home/ansible/Ansible/ec2.py" tag_Name_Tomcat -u tomcat ---private-key="/home/ansible/Ansible/Tomcat.pem"
ansible -m ping -i host-jenkins-master jenkins_master

# gathering facts.
ansible -m setup -i host-jenkins-master jenkins_master

# checking uptime of node machine(s).
ansible -m command -a "uptime"   -i host-jenkins-master jenkins_master

# checking kernel version of node(s).
ansible -m command -a "uname -r" -i host-jenkins-master jenkins_master

# generating crypto password.
ansible all -i localhost, -m debug -a "msg={{ 'Ramanujam' | password_hash('sha512', 'hellosalt') }}"

# checking ansible syntax.
ansible-playbook --syntax-check jenkins-master.yml

# checking ansible syntax with inventory file.
ansible-playbook -i hosts --syntax-check jenkins-master.yml
ansible-playbook -i host-tomcat --syntax-check tomcat.yml

# specifying inventory host path.
ansible-playbook -v -i host-tomcat tomcat.yml
ansible-playbook -v -i "/home/ansible/Ansible/ec2.py" tag_Name_Tomcat -u tomcat ---private-key="/home/ansible/Ansible/Tomcat.pem" Tomcat.yml
ansible-playbook -v -i hostfile jenkins-master.yml
ansible-playbook -v -i webhostfile -i dbhostfile jenkins-master.yml

# verbosing ansible syntax with inventory file.
ansible-playbook -v -i hosts --syntax-check jenkins-master.yml

# try to predict some of the changes that may occur.
ansible-playbook -C jenkins-master.yml
ansible-playbook -C -v -i hosts jenkins-master.yml

# pip3 install ansible-lint
# checking playbook for errors before execution.
ansible-lint jenkins-master.yml

# checking what hosts would be affected by playbook before run it.
ansible-playbook playbook.yml --list-hosts

# running  ansible playbook.
ansible-playbook -v -i hosts jenkins-master.yml

# launching aws ec2 instance.
ansible-playbook -v ec2-ubuntu.yml --private-key=/root/.ssh/tomcat-test.pem

# creating a role using ansible-galaxy.
ansible-galaxy init tomcat


{% for host in groups['jenkins_slave'] %}
  {{ host }}
{% endfor %}


{% for host in groups['jenkins_slave'] %}
  {{ hostvars[host]['ansible_eth0']['ipv4']['address'] }}
{% endfor %}


ansible -m debug -a "var=hostvars['hostname']" -i host-jenkins-master jenkins_master

# https://docs.ansible.com/ansible/2.9/user_guide/intro_dynamic_inventory.html#inventory-script-example-aws-ec2
# https://raw.githubusercontent.com/ansible/ansible/stable-2.9/contrib/inventory/ec2.ini
ansible -i ec2.py tag_Name_WebApp -m ping -u ubuntu --private-key=/home/ubuntu/Ansible/webapp.pem
