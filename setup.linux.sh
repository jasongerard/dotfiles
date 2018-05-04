#!/bin/bash

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    silversearcher-ag \
    python-pip \
    jq

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip2 install sexpdata websocket-client

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

sudo usermod -a -G docker $USER

curl -fLo go1.10.2.linux-amd64.tar.gz https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xf go1.10.2.linux-amd64.tar.gz
rm go1.10.2.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/* /usr/local/bin/

curl -fLo node-v8.10.0-linux-x64.tar.xz https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
sudo tar -C /usr/local -xf node-v8.10.0-linux-x64.tar.xz
rm node-v8.10.0-linux-x64.tar.xz
sudo ln -s /usr/local/node-v8.10.0-linux-x64/bin/* /usr/local/bin/
