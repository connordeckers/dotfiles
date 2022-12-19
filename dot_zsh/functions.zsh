fe() { 
  editpath=$(find . -type f | fzf)
  if [[ "$editpath" != "" ]]; then $EDITOR $editpath; fi
}

install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then return; fi
  done
  precmd_functions+=(powerline_precmd)
}

consumption () {
 sudo du -chax --max-depth=1 $1 | grep -E "^[0-9\.]*[MG]"
}


claim () { sudo chown -R $USER:$USER $1 }
mkcd () { mkdir -p $1 && cd $1 }

rollback_update() {
	if [[ $1 == '' ]]; then
		print 'Date must be supplied, relative or absolute accepted.'
		return
	fi

	# Get a unique ID to keep our good mirrorlist 
	timestamp=$(date +%s)

	# Rename the mirrorlist with our timestamp
	sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist."$timestamp"

	# Create a new mirrorlist file to tee into
	sudo touch /etc/pacman.d/mirrorlist

	# Get a date object from the timestamp, as year month and day
	year=$(date --date $1 "+%Y")
	month=$(date --date $1 "+%m")
	day=$(date --date $1 "+%d")

	# Tee the archive of the mirror into the mirrorlist file
	echo "Server=https://archive.archlinux.org/repos/$year/$month/$day/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist

	# Force pacman to update the cache (yy forces it to refetch even if it considers itself up to date)
	# and uu forces it to allow packages to downgrade
	sudo pacman -Syyuu

	# Once the downgrade is done, revert our changes to the mirrorlist
	sudo rm /etc/pacman.d/mirrorlist
	sudo mv /etc/pacman.d/mirrorlist."$timestamp" /etc/pacman.d/mirrorlist
	
	# Update the mirrorlist, but not the packages themselves
	sudo pacman -Syy
}


# Allow file watching and recompiling
on_file_change() {
  inotifywait -m -r -e create,close_write,moved_to --format %e/%w%f . |
  while IFS=/ read -r events file; do
    if [ ! -z `echo "$file" | grep -E "$1$"` ]; then
      printf '[%s] %s\n'  "$(date +"%T.%N")" "$file updated"
      eval "$2"
    fi
  done
}

clean_path() {
  export PATH=$(echo $PATH | sed 's|:|\n|g' | awk '!x[$0]++' | sed ':a; N; $!ba; s|\n|:|g')
}

_launch_tmux() {
	# Autostart if not already in tmux and enabled.
	if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
			_zsh_tmux_plugin_run
	fi
}
