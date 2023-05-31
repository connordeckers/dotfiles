function yzf
  set pos $argv[1]
	set args $argv[2..]

	set history_loc $XDG_STATE_HOME/fzf
	if set -q FZF_HISTDIR
		set history_loc $FZF_HISTDIR
	end

  sed "s/ /\t/g" |
    fzf \
			--nth=$pos \
			--multi \
			--history="$history_loc/history-yzf$pos" \
			--preview-window=60%,border-left \
			--bind="double-click:execute(xdg-open 'https://archlinux.org/packages/{$pos}'),alt-enter:execute(xdg-open 'https://aur.archlinux.org/packages?K={$pos}&SB=p&SO=d&PP=100')" \
       $args | cut -f$pos | xargs
end
