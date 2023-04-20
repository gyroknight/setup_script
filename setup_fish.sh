#!/opt/homebrew/bin/fish

# Sets up fish.
set fish_greeting
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
cp fish/fish_plugins ~/.config/fish/
mkdir ~/.ssh # Needed for ssh-agent to work
fisher update

# Fig setup
stat ~/Library/LaunchAgents || mkdir ~/Library/LaunchAgents
sudo chown (whoami) ~/Library/LaunchAgents
fig login
fig doctor
