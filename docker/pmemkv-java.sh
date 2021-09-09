#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv-java.git
cd pmemkv-java
mvn install -Dmaven.test.skip=true
cd ..
rm -r pmemkv-java
