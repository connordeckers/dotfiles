function describe --description "Identifies whether something is a function, abbreviation or application."
	set -l arg $argv[1]
	if test -z "$arg"; return 0; end

	if functions -q $arg
		functions $arg;
	else if abbr -q $arg
		abbr --show $arg
	else if type -q $arg
		which -a $arg
	else
		fish_command_not_found $argv
	end
	
	return $status
end
