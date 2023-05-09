function files --description 'opens the provided path in Windows Explorer'
	set -l dir $argv 
	test -z "$dir"; and set dir $pwd

	set -l ref (wslpath -w "$dir")
	/mnt/c/windows/explorer.exe "$ref"
end
