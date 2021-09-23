#!/bin/bash -ex

git clone https://github.com/pmem/valgrind.git
cd valgrind
./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) install
cd ..
rm -r valgrind
