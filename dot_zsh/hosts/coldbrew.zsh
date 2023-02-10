alias copy="xclip -selection c"
alias paste="xclip -selection c -o"

random-wallpaper() {
	DIR=${1:-$HOME/Pictures/wallpapers/}
	SAVED=$DIR/.wallpaper
	
	IMG=$(/usr/bin/ls "$DIR" | shuf | head -n 1)

	ln -sf "$IMG" "$SAVED"

	feh --bg-fill "$SAVED"
}

# Load pyenv automatically by appending the following to your shell's login startup file (for login shells)
# and your shell's interactive startup file (for interactive shells) :
export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.
