# if (( $+commands[starship] )); then
# 	unset ZSH_THEME
#   eval "$(starship init zsh)"
# else
	ZSH_THEME="powerlevel10k/powerlevel10k"
# fi

# Start tmux with the shell
ZSH_TMUX_AUTOSTART=true

# User configuration
source $ZSH_CUSTOM/utils/clipboard.zsh
source $ZSH_CUSTOM/vi-mode.zsh

source $ZSH_CUSTOM/aliases.zsh
source $ZSH_CUSTOM/functions.zsh
