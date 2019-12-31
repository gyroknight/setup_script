# Suppress fish greeting
set fish_greeting
fish_vi_key_bindings

# If ssh-agent is not active, start ssh-agent
if not pgrep ssh-agent > /dev/null
	eval (ssh-agent -c) 
end

# Add to PATH
set -a PATH ~/.local/bin

# Attach tmux session
# Creates a session with the given name and attach/switch to it
function ats
	if test (count $argv) -eq 1
		if not tmux has -t $argv > /dev/null 2>&1
			tmux new -s $argv -d
		end

		if not set -q TMUX
			tmux a -t $argv
		else
			tmux switch -t $argv
		end
	else
		false
	end
end

clear
