#!/bin/zsh

# A script to install stuff on new machines, by Vincent Zhao

rootpath=$(pwd)

sudo -v # Store password for Homebrew install
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
grep "brew" ~/.zprofile || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask-versions
brew install git fish vim curl tmux firefox-nightly htop neofetch python@3.11 cmake unzip iterm2-beta discord google-chrome plex telegram pam-reattach fig keepassxc stats alt-tab lolcat parallel
pip3 install --upgrade pip
git config --global user.name "Vincent Zhao"
git config --global user.email "gyroknight@users.noreply.github.com"
git config --global core.editor "vim"
cp tmux.conf ~/.tmux.conf

#Vim setup
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd $rootpath
pip3 install powerline-status
cp vimrc ~/.vimrc 
mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp
cp ycm_global_ycm_extra_conf.py ~/.vim/.ycm_global_ycm_extra_conf.py

git clone https://github.com/easymotion/vim-easymotion.git ~/.vim/pack/plugins/start/vim-easymotion
git clone https://github.com/bkad/CamelCaseMotion.git ~/.vim/pack/plugins/start/CamelCaseMotion.vim

git clone https://github.com/joshdick/onedark.vim.git ~/.vim/pack/colors/opt/onedark.vim

#Fish setup
grep "fish" /etc/shells || echo `which fish` | sudo tee -a /etc/shells
chsh -s `which fish`
mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/
./setup_fish.sh
