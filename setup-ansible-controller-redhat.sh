#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2019,
# Description : Setup of ansible-controller on RHEL8.

# Note: Please run this script with sudo privilage.

# updating packages index.
yum update

# installing python3.
yum -y module install python36

# installing pip3
yum -y install python3-pip

# installing ansible and ansible-lint.
pip3 install ansible ansible-lint
