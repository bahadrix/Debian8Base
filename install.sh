#!/usr/bin/env bash
echo "Debian 8 Base Setup & Colors"

function appendLine {
    FILE=$1
    LINE=$2
    grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

REMOTE_ROOT="https://raw.githubusercontent.com/bahadrix/Debian8Base/master"

echo "Creating directories"

mkdir -p  ~/.vim/autoload
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/bundle/vim-colors-solarized/autoload
mkdir -p ~/.vim/bundle/vim-colors-solarized/colors
mkdir -p ~/.vim/bundle/vim-colors-solarized/doc

echo "Getting Pathogen.."
curl "$REMOTE_ROOT/assets/colors/pathogen.vim" > ~/.vim/autoload/pathogen.vim

echo "Getting Solarized.."
curl "$REMOTE_ROOT/assets/colors/vim-colors-solarized/autoload/togglebg.vim" > ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
curl "$REMOTE_ROOT/assets/colors/vim-colors-solarized/colors/solarized.vim" > ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim
curl "$REMOTE_ROOT/assets/colors/vim-colors-solarized/doc/tags" > ~/.vim/bundle/vim-colors-solarized/doc/tags
curl "$REMOTE_ROOT/assets/colors/vim-colors-solarized/doc/togglebg.txt" > ~/.vim/bundle/vim-colors-solarized/doc/togglebg.txt
curl "$REMOTE_ROOT/assets/colors/vim-colors-solarized/README.mkd" > ~/.vim/bundle/vim-colors-solarized/README.mkd

echo "Setting dir colors.."
sudo curl "$REMOTE_ROOT/assets/colors/dircolors.256dark" > /etc/dircolors.256dark

echo "Setting vimrc.."
cat ~/.vimrc > ~/.vimrc.bak
appendLine ~/.vimrc 'execute pathogen#infect()'
appendLine ~/.vimrc 'filetype plugin indent on'
appendLine ~/.vimrc 'syntax enable'
appendLine ~/.vimrc 'set background=dark'
appendLine ~/.vimrc 'let g:solarized_termcolors=256'
appendLine ~/.vimrc 'colorscheme solarized'

echo "Setting bashrc.."
cat ~/.bashrc > ~/.bashrc.bak
appendLine ~/.bashrc "export TERM=xterm-256color"
appendLine ~/.bashrc "export LS_OPTIONS='--color=auto'"
appendLine ~/.bashrc "eval `dircolors /etc/dircolors.256dark`"
appendLine ~/.bashrc "alias ls='ls \$LS_OPTIONS'"
appendLine ~/.bashrc "alias ll='ls \$LS_OPTIONS -l'"
appendLine ~/.bashrc "alias l='ls \$LS_OPTIONS -lA'"
