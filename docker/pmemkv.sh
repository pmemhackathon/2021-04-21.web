#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv
cd pmemkv
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j$(nproc) install
cd ../..
rm -r pmemkv
