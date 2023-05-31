function organise-patches
	function link
		set -l target $argv[1]
		set -l file $argv[2]
		set -l root (pwd)

		command ln -s $root/$file $root/$target/$file
	end

	function move 
		set -l target $argv[1]
		set -l rule $argv[2]
		set -l file $argv[3]
		set -l contents $argv[4]

		set -l root (pwd)
		
		if string match -qeri -- $rule $contents
			link $target $file
			set -a resolved $file
			return 0
		else 
			return 1
		end
	end


	for patch in $argv
		set -l firstline (head -n1 $patch | string collect -Na)

		move mail '^from' $patch $firstline
		or move author '^author' $patch $firstline
		or move git-diffs '^diff --git' $patch $firstline
		or move diffs '^---' $patch $firstline
		or move diffs '^diff' $patch $firstline
		or printf "unknown: %s\n" $patch
	end

end
