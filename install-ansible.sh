#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 27 May 2019,
# Description : Installing ansible on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing python3 and python3-pip.
apt -y install python3 python3-pip vim

# installing ansible.
pip3 install ansible
