#!/usr/bin/env bash

[[ $(which git) ]] || ~/bin/install.sh -y git

atom_file=atom-amd64.deb
remote_file_location=https://github.com/atom/atom/releases/download/v1.13.1
wget -O /tmp/${atom_file} ${remote_file_location}/${atom_file}
sudo dpkg -i /tmp/${atom_file} && rm /tmp/${atom_file}
