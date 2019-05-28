#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 27 May 2019,
# Description : Installing python3 on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index.
apt update

# upgrading packages.
DEBIAN_FRONTEND=noninteractive apt -y upgrade

# adding python repo.
add-apt-repository -y ppa:deadsnakes/ppa -u

# installing aptitude, python3.
apt install -y aptitude python3.5
