files() {
	DIR=${1:-$PWD}
	REF=$(wslpath -w "$DIR")
	explorer.exe "$REF"
}

alias copy="clip.exe"
alias paste="clip.exe -p"
