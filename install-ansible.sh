#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 27 May 2019,
# Description : Installing ansible on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing software-properties-common.
apt install -y software-properties-common

# adding ansible repo.
apt-add-repository -y ppa:ansible/ansible -u

# installing ansible.
apt -y install ansible
