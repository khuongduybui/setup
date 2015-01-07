function l
	if which sw_vers >/dev/null 2>&1
		ls -laGHf $argv
	else
		ls -lahF --color
	end
end
