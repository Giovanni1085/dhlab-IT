#!/bin/bash

wget "https://googledrive.com/host/0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0/CRF++-0.58.tar.gz" -O CRF++.tar.gz
tar -xzf CRF++.tar.gz
cd CRF++-0.58/
./configure
make
make install
make clean
ldconfig
# install python bindings
pip install -e python/
rm ../CRF++.tar.gz
