function rst
	xrdb merge ~/.Xresouces
	
	if set pid (pidof st)
		kill -USR1 $pid
	end
end
