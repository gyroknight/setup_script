#!/usr/bin/fish

# Sets up fish.
set fish_greeting
git clone https://github.com/oh-my-fish/oh-my-fish
cd oh-my-fish
bin/install --offline
omf install agnoster
