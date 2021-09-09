#!/bin/bash -ex

git clone https://github.com/memkind/memkind
cd memkind
git checkout v1.12.0
./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) install
cd ..
rm -r memkind
