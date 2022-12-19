alias copy="xclip -selection c"
alias paste="xclip -selection c -o"

random-wallpaper() {
	DIR=$HOME/Pictures/wallpapers/
	SAVED=$DIR/.wallpaper
	
	IMG=$(/usr/bin/ls "$DIR" | shuf | head -n 1)

	ln -sf "$IMG" "$SAVED"

	feh --bg-fill "$SAVED"
}
