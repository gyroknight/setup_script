if not pgrep ssh-agent > /dev/null
	ssh-agent /usr/bin/fish
end

if tmux ls; and not set -q TMUX
	tmux a
else 
	tmux new -s main
end

clear
