function l
	if which sw_vers >/dev/null 2>&1
		ls -laGhF $argv
	else
		ls -lahF --color
	end
end
