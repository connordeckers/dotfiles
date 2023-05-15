function tmux --description 'alias tmux tmux'
	if test (count $argv) -gt 0
		command tmux $argv
		return $status
	end
	
	# There are certain environments we don't want to nest tmux into.
	set -l FORBIDDEN_ENV $TMUX $INSIDE_EMACS $EMACS $VIM $SSH_CONNECTION $VSCODE_RESOLVING_ENVIRONMENT
	if test (count $FORBIDDEN_ENV) -gt 0; return; end
	
	# We don't want to launch a new instance inside of VSCode
	if test "$TERM_PROGRAM" = 'vscode'; return; end
	
	# We also don't want to run if it's within a root session
	if fish_is_root_user; return; end
	
	# By this stage, we've passed the tests.
	# Let's configure the new session.
	if type -q fname; tmux new-session -s (fname)
	else; tmux new-session
	end
        
end
