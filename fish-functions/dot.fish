function dot
	if test -f ~/.$argv[1]rc
		edit ~/.$argv[1]rc
	else
		edit ~/.$argv[1]
	end
end
