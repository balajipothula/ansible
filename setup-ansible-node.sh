#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 01 June 2019,
# Description : Setup of ansible-node on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# installing python3 and python3-pip.
apt -y install python3 python3-pip vim

# installing python docker package.
pip3 install docker
