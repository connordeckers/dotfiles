function basename
	echo (resolve_path $argv[1] | string split -r -m1 -f2 '/')
end

function sudo --description 'alias sudo sudo'
	set -l EDITORS $SUDO_EDITOR $VISUAL $EDITOR
	set -l FULL_PATHS (for E in $EDITORS; basename $E; end)

	#	If there's no editor env set, no point continuing.
	if test (count $EDITORS) -eq 0
			command sudo $argv
			return $status
	end

	set -l bin (basename $argv[1])
	if contains $bin $FULL_PATHS; command sudo -e $argv[2..]
	else; command sudo $argv
	end

	return $status
end
