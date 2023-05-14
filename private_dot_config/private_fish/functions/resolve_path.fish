function resolve_path --description "Resolves an abbreviation, alias or application to its path"
	argparse q/quiet -- $argv
    or return

	set -l arg (string split -f1 ' ' $argv[1])
	set -l application $arg

	if test -z "$arg"; return 0; end
	

	set -l is_aliased false
	for line in (alias)
		begin
			set -l parts (string split ' ' $line)
			set -l alias $parts[2]
			set -l output $parts[3]

			if ! string match -eiq $application $alias; continue; end
			set is_aliased true
			set application $output
		end
	end

	set -l base_path_app ''
	if type -P $application &>/dev/null
		set base_path_app (type -P $application | string collect)
	end

	if test -n $base_path_app
		if not set -q _flag_quiet; echo $base_path_app; end
		return 0
	else
		echo $application
		return 1
	end
end
