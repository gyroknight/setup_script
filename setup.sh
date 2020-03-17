#!/bin/bash

# A script to install stuff on new machines, by Vincent Zhao

rootpath=$(pwd)

# Fail on any error
# set -e

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git fish vim curl tmux htop screenfetch cmake python unzip
sudo pacman -Rs --noconfirm vi
sudo pacman -Qdtq | sudo pacman -Rs --noconfirm -
pamac build --no-confirm firefox-nightly onedrive-abraunegg visual-studio-code-insiders shim-signed slack-desktop vi-vim-symlink
# pip3 install --upgrade pip
git config --global user.name "Vincent Zhao"
git config --global user.email "gyroknight@users.noreply.github.com"
git config --global core.editor "vim"
cp tmux.conf ~/.tmux.conf

#Vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd $rootpath
sudo pip3 install powerline-status
cp vimrc ~/.vimrc
mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp
cp ycm_global_ycm_extra_conf.py ~/.vim/.ycm_global_ycm_extra_conf.py

#Fish setup
chsh -s `which fish`
mkdir -p ~/.config/fish
cp config.fish ~/.config/fish/
