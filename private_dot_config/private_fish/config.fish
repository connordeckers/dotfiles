if status is-interactive
    # Commands to run in interactive sessions can go here
		
		# Emulates vim's cursor shape behavior
		# Set the normal and visual mode cursors to a block
		set fish_cursor_default block
		# Set the insert mode cursor to a line
		set fish_cursor_insert line blink
		# Set the replace mode cursor to an underscore
		set fish_cursor_replace_one underscore
		# The following variable can be used to configure cursor shape in
		# visual mode, but due to fish_cursor_default, is redundant here
		set fish_cursor_visual block

		# Set abbreviations
		abbr -a --set-cursor='%' -- clone 'git clone git@github.com:%'
		abbr -a -- dc 'docker compose'
		abbr -a --position anywhere --function _fish_last_history_item -- !!
		abbr -a -- cz chezmoi

		# Don't start tmux if running as root
		if ! fish_is_root_user;
			and test $fish_tmux_autostart = true; 
			and test -z $TMUX; 
			and test -z $INSIDE_EMACS; 
			and test -z $EMACS; 
			and test -z $VIM; 
			and test -z $SSH_CONNECTION; 
			and test -z $VSCODE_RESOLVING_ENVIRONMENT; 
			and test "$TERM_PROGRAM" != 'vscode'
				if type -q fname; tmux new-session -s (fname)
				else; tmux new-session
				end
		end
end
