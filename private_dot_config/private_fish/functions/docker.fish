function docker --description 'alias docker docker'
	if string match -qer '^/home/lab' (pwd)
		command docker -c server $argv
	else
		command docker $argv
	end
end
