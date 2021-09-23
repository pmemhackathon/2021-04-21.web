#!/bin/bash -ex

git clone https://github.com/pmem/pmdk
cd pmdk
make -j$(nproc)
make -j$(nproc) install prefix=/usr
cd ..
rm -r pmdk
