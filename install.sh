#!/usr/bin/env bash

REMOTE_ROOT="https://raw.githubusercontent.com/bahadrix/Debian8Base/master"

sudo apt-get install -y curl

echo "Creating directories"

mkdir -p  ~/.vim/autoload
mkdir -p ~/.vim/bundle

curl "$REMOTE_ROOT/assets/colors/"


{ src: 'assets/colors/pathogen.vim', dest: '~/.vim/autoload/pathogen.vim' }
     - { src: 'assets/colors/vim-colors-solarized', dest: '~/.vim/bundle/' }
     - { src: 'assets/colors/dircolors.256dark', dest: '/etc/dircolors.256dark' }