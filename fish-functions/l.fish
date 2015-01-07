function l
	if which sw_vers
		ls -laGHf $argv
	else
		ls -laHf --color
	end
end
