#!/bin/bash
# (this script should be ran as root/with sudo!)
#
# Install dependencies for SciPy/Scikit-learn
#
apt-get update --fix-missing
apt-get install gfortran libopenblas-dev liblapack-dev
#
# install CRF++
#
curl -s https://raw.githubusercontent.com/mromanello/dhlab-IT/master/scripts/install-crfpp.sh >> install-crfpp.sh; chmod +x install-crfpp.sh; ./install-crfpp.sh
#
# install treetagger
#
curl -s https://raw.githubusercontent.com/mromanello/dhlab-IT/master/scripts/install-treetagger.sh >> install-treetagger.sh; chmod +x install-treetagger.sh; ./install-treetagger.sh
