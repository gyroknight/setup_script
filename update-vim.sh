#!/usr/bin/fish

#Vim setup
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
for val in *
	cd $val
	git pull
	cd ..
end
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
