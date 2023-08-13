if ! (( $+commands[tmux] )); then
  print "zsh tmux plugin: tmux not found. Please install tmux before using this plugin." >&2
  return 1
fi

# CONFIGURATION VARIABLES
# Automatically start tmux
: ${ZSH_TMUX_AUTOSTART:=false}
# Only autostart once. If set to false, tmux will attempt to
# autostart every time your zsh configs are reloaded.
: ${ZSH_TMUX_AUTOSTART_ONCE:=true}
# Automatically connect to a previous session if it exists
: ${ZSH_TMUX_AUTOCONNECT:=true}
# Automatically close the terminal when tmux exits
: ${ZSH_TMUX_AUTOQUIT:=$ZSH_TMUX_AUTOSTART}
	
# There are certain environments we don't want to nest tmux into.
local -a FORBIDDEN_ENV
FORBIDDEN_ENV=(
	$TMUX 
	$INSIDE_EMACS 
	$EMACS 
	$VIM 
	$SSH_CONNECTION 
	$VSCODE_RESOLVING_ENVIRONMENT
)

# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"



# Wrapper function for tmux.
function _zsh_tmux_plugin_run() {
  if [[ -n "$@" ]]; then
    command tmux "$@"
    return $?
  fi

  command tmux -u new-session -s $(fname)

	# Handle autoquitting
  [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]] && exit
}

# Use the completions for tmux for our function
compdef _tmux _zsh_tmux_plugin_run
# Alias tmux to our wrapper function.
alias tmux=_zsh_tmux_plugin_run

# Autostart if not already in tmux and enabled.
if [[ "$ZSH_TMUX_AUTOSTART" == "true" && ${#FORBIDDEN_ENV[@]} -eq 0 ]]; then
  # Actually don't autostart if we already did and multiple autostarts are disabled.
  if [[ "$ZSH_TMUX_AUTOSTART_ONCE" == "false" || "$ZSH_TMUX_AUTOSTARTED" != "true" ]]; then
    export ZSH_TMUX_AUTOSTARTED=true
    _zsh_tmux_plugin_run
  fi
fi
