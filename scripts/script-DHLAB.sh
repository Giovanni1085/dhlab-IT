#!/bin/bash
apt-get update
apt-get upgrade -y

# Install LDAP + Autmount
wget -O script-ldap.sh https://raw.githubusercontent.com/mromanello/dhlab-IT/master/scripts/script-ldap.sh
chmod a+x script-ldap.sh
./script-ldap.sh
rm script-ldap.sh
echo "+ : root (DHLAB-unit) (IC-IT-unit): ALL" >> /etc/security/access.conf
echo "- : ALL : ALL" >> /etc/security/access.conf

# Format and partition scratch space
curl -s http://install.iccluster.epfl.ch/scripts/it/scratchVolume.sh  >> scratchVolume.sh ; chmod +x scratchVolume.sh ; ./scratchVolume.sh

# Mount NAS shares
apt-get install -y cifs-utils
# ATTENTION!!!!! No folder with a white space in it!! like "Le Temps" or "Linked Books"
for folder in {"cluster-nas","homes","Garzoni","le_temps_data","ngrams"}; do  #No space in the list! 
mkdir "/mnt/$folder"
cat <<EOF >> /etc/fstab
//dhlabsrv1.epfl.ch/$folder /mnt/$folder cifs _netdev,iocharset=utf8,username=cluster,password=QXA{1f,sec=ntlmssp,gid=100 0 0
EOF
done
mount -a

# Install MATLAB 8.5a
curl -s http://install.iccluster.epfl.ch/scripts/soft/matlab/matlab85a.sh  >> matlab85a.sh ; chmod +x matlab85a.sh; ./matlab85a.sh

#generic dependencies
apt-get install -y g++ git nfs-common htop screen vim unzip cmake cmake-curses-gui

# python ftw
apt-get install -y python-numpy python-pip python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

# scikit-learn, could be built from source as well
apt-get install -y python-sklearn

# Install CUDA
wget -O install-cuda.sh https://raw.githubusercontent.com/mromanello/dhlab-IT/master/scripts/install-cuda.sh
chmod a+x install-cuda.sh
./install-cuda.sh
rm install-cuda.sh

# caffe dependencies (http://caffe.berkeleyvision.org/install_apt.html)
#apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler 
#apt-get install -y --no-install-recommends libboost-all-dev
#apt-get install -y libatlas-base-dev
#apt-get install -y libopenblas-dev
# for ubuntu 14.04
#apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
