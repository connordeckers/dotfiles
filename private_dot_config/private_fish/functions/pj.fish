function __project_name 
	set -l cwd $argv[1]
	if test -f (path resolve "$cwd/package.json")
		printf "%s | NodeJS" (cat "$cwd/package.json" | jq -r '.name')
		return 0
	# else 
	# 	echo "project"
	# 	return 0
	end

	return 1
end

function __project_basenames --description "List of project basenames" --argument-names comp
  set -l project_paths

	if not set -q comp[1]
			set comp (commandline -ct)
	end

  for pp in $PROJECT_PATHS
		set searchpath (printf "%s/%s" (path normalize $pp) $comp)
		set curr_searchterm .
		if not test -d $searchpath # It's not a directory
			set -l parts (string split -rm1 / $searchpath)
			set searchpath $parts[1]
			set curr_searchterm $parts[2]
		end

		set search_results (fd --type d --max-depth 2 $curr_searchterm $searchpath | awk '{ print length, $0 }' | sort -n | cut -d" " -f2-| string replace $pp/ '' | string split '\n' | string trim)
		
		for path in $search_results
			set package_name (__project_name $pp/$path)
			set -a project_paths (printf "%s\t%s" $path $package_name | string trim)
		end
  end

	# if test (count $project_paths) -eq 0
	# 	echo "nothing found"
	# 	# Test if it's a good subpath
	# 	if set targets (fd --type d . $PROJECT_PATHS | grep $comp)
	# 		echo (count $targets)
	# 		# for path in $targets
	# 		# 	set shortname ($path | string replace $HOME ~)
	# 		# 	if set package_name (__project_name $path)
	# 		# 		set -a project_paths (printf "%s\t%s" $shortname $package_name)
	# 		# 	else
	# 		# 		set -a project_paths $shortname
	# 		# 	end
	# 		# end
	# 		return 0
	# 	end
	# end

	printf "%s\n" $project_paths
end

function _pj_editor
	set -l editors "$VISUAL" "$EDITOR" nano nvim vim vi emacs pico qe mg jed gedit mcedit gvim
	for editor in $editors
		if type -q $editor
			exec $editor $argv
			break;
		end
	end
end

function _pj_find
  if test $argv[1] = "open"
    set -l target (find $PROJECT_PATHS -maxdepth 1 -name $argv[2] | head -n 1)

    if test -n "$target"
      cd $target
      eval $EDITOR $target
    else
      echo "No such project: $argv[2]"
      return 1
    end

  else
    set -l target (find $PROJECT_PATHS -maxdepth 1 -name $argv[1] | head -n 1)

    if test -n "$target"
      cd $target
    else
      echo "No such project: $argv[1]"
      return 1
    end
  end
end

function _pj_fd
	set -l searchvalue
	
	if test $argv[1] = 'open'; set searchvalue $argv[2]
	else; set searchvalue $argv[1]; end

	set -l target (fd --type d . $PROJECT_PATHS | grep -m1 $searchvalue)
	if test -n "$target"
		cd $target
		if test $argv[1] = 'open'
			_pj_editor $target
		end
	else
		echo "No such project: $argv[1]"
		return 1
	end

end

function pj --description "Jump to a project"
  set -l argc (count $argv)

  if test (count $PROJECT_PATHS) -eq 0
    echo 'Add some directories to the environment variable $PROJECT_PATHS to get started!'
    echo '  set -gx PROJECT_PATHS ~/dir1 ~/dir2'
    return 1
	
	else if test $argc -le 0 -o $argc -gt 2
    echo 'Usage: pj [open] [PROJECT]'
    return 1

  else if test $argc -eq 2 -a $argv[1] != 'open'
    echo 'Usage: pj [open] [PROJECT]'
    return 1

  else if contains -- --help $argv
    echo 'Usage: pj [open] [PROJECT]'

	else if type -q fd
		_pj_fd $argv
	
	else
		_pj_find $argv
	end
end
