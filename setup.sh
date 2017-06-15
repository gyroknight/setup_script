#!/bin/bash

# A script to install stuff on new machines, by Vincent Zhao
add-apt-repository ppa:fish-shell/release-2 -y
add-apt-repository ppa:git-core/ppa -y
apt-get update
apt-get install git -y
apt-get install fish -y
apt dist-upgrade -fy
apt-get autoremove -y
git config --global user.name "Vincent Zhao"
git config --global user.email "zhao.v@husky.neu.edu"
curl -L https://get.oh-my.fish | fish
fish
