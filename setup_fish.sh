#!/opt/homebrew/bin/fish

# Sets up fish.
set fish_greeting
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
cp fish/fish_plugins ~/.config/fish/
fisher update
