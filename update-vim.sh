#!/opt/homebrew/bin/fish

# Update Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Update YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer

# Update all git repos for Vim
find ~/.vim -name '.git' -prune -type d -print | parallel --eta 'echo {}; git -C {}/.. pull'
