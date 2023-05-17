function _fay_resources
	set -l pkg $argv
	set info (yay -Si $pkg 2>/dev/null)
	# set files (yay -Fl $pkg 2>/dev/null | string split ' ' -f2)

	printf "%s\n" $info
end
