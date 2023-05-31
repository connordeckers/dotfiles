function smux --wraps=ssh --description 'Open an SSH connection in tmux'
	set -l target $argv[1]

	# set -l cmd "tmux new-session -dP -E ssh-connection $target -A -s [SSH] $target '/bin/zsh'"
	set -l cmd "tmux new-session -dPAs '(SSH) $target' -- ssh $target"

	set -l session (eval $cmd)

	tmux setenv -t $session sshenv $target
	tmux attach -t $session
end
