#!/bin/bash -ex

gem install bundler -v '< 2.0'
git clone https://github.com/pmem/pmemkv-ruby.git
cd pmemkv-ruby
# bundle package command copies all of the .gem files needed to run the application
# into the vendor/cache directory
bundle package
bundle install
cd ..
rm -rf pmemkv-ruby
