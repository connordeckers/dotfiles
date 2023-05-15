if not set -q $fisher_path
	set -Ux fisher_path $__fish_config_dir/plugins
end

if not contains $fisher_path/functions $fish_function_path
	set -gp fish_function_path $fisher_path/functions
end

if not contains $fisher_path/completions $fish_complete_path
	set -gp fish_complete_path $fisher_path/completions
end

# As last part of initialization, source the conf directories.
# Implement precedence (User > Admin > Extra (e.g. vendors) > Fish) by basically doing "basename".
set -l sourcelist
for file in $fisher_path/conf.d/*.fish
    set -l basename (string replace -r '^.*/' '' -- $file)
    contains -- $basename $sourcelist
    and continue
    
		set sourcelist $sourcelist $basename
    # Also skip non-files or unreadable files.
    # This allows one to use e.g. symlinks to /dev/null to "mask" something (like in systemd).
    if test -f $file -a -r $file
			source $file
		end


end
