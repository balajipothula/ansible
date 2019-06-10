#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 27 May 2019,
# Description : Setup of ansible-controller on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing python3 and python3-pip.
apt -y install python3 python3-pip vim

# installing ansible and ansible-lint.
pip3 install ansible ansible-lint
