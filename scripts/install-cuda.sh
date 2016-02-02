#!/bin/bash

# Thanks to Carlos Perez for the script

apt-get update
apt-get install build-essential libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev -y
wget -P /tmp http://install.iccluster.epfl.ch//scripts/soft/cuda/cuda_7.5.18_linux.run
chmod +x /tmp/cuda_7.5.18_linux.run
/tmp/cuda_7.5.18_linux.run --silent
echo "/usr/local/cuda/lib64" | tee /etc/ld.so.conf.d/cuda.conf
source /etc/environment
echo PATH="$PATH:/usr/local/cuda/bin" > /etc/environment

# Install cudnn
wget http://install.iccluster.epfl.ch/scripts/soft/cuda/cudnn-7.0-linux-x64-v4.0-rc.tgz -O /tmp/cudnn-7.0-linux-x64-v4.0-rc.tgz
tar -zxf  /tmp/cudnn-7.0-linux-x64-v4.0-rc.tgz -C /tmp/
cp /tmp/cuda/include/cudnn.h /usr/local/cuda-7.5/include/
cp /tmp/cuda/lib64/* /usr/local/cuda-7.5/lib64/
