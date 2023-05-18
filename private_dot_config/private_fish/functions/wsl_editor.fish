function wsl_editor
	set -l path (wslpath $argv)
	$EDITOR $path
end
