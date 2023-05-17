function nvim --wraps=nvim
	command nvim --listen /tmp/nvimsocket $argv
end
