function preview-offbranch
	argparse 'e/editor=' -- $argv
	or return

	set -q _flag_editor || set _flag_editor $EDITOR

	set loc $argv[1]
	set path $argv[2]

	set hash (git rev-parse --short $loc)
	
	set tmp_path /tmp/git/$hash
	set tmp_loc $tmp_path/(path basename $path)

	mkdir -p $tmp_path

	git show $hash:$path > $tmp_loc
	$_flag_editor $tmp_loc
end
