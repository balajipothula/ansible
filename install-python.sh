#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2019,
# Description : Installing / Compiling Python from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make openssl-devel bzip2-devel libffi-devel

# python downloading, extracting and compiling.
curl -JL https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz -o $HOME/Python.tgz && \
tar -xzf $HOME/Python.tgz -C $HOME                                                    && \
rm  -rf  $HOME/Python.tgz                                                             && \
mv       $HOME/Python-* Python                                                        && \
mkdir -p $HOME/python                                                                 && \
cd       $HOME/Python                                                                 && \
./configure --enable-optimizations --prefix=$HOME/python                              && \
make altinstall                                                                       && \
cd       $HOME                                                                        && \
rm  -rf  $HOME/Python                                                                 && \
ln       $HOME/python/bin/python3.7 $HOME/python/bin/python                           && \
ln       $HOME/python/bin/pip3.7    $HOME/python/bin/pip                              && \
echo "export PATH=$PATH:$HOME/python/bin" >> $HOME/.bashrc                            && \
exec $BASH
