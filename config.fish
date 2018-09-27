set fish_greeting
fish_vi_key_bindings

if not pgrep ssh-agent > /dev/null
	ssh-agent /usr/bin/fish
end

if status is-interactive
	if tmux ls; and not set -q TMUX
		tmux a
	else 
		tmux new -s main
	end
end

clear
