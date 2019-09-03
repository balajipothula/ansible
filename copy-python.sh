#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 02 September 2019,
# Description : Python Setup on Ansible Node.

tar -xzf python.tar.gz                                      && \
rm  -rf  $HOME/python.tar.gz                                && \
rm  -rf  $HOME/python/bin/python                            && \
rm  -rf  $HOME/python/bin/pip                               && \
ln       $HOME/python/bin/python3.7 $HOME/python/bin/python && \
ln       $HOME/python/bin/pip3.7    $HOME/python/bin/pip    && \
echo "export PATH=$PATH:$HOME/python/bin" >> $HOME/.bashrc
