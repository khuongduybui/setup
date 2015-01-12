function l
	if __is_mac
		ls -laGhF $argv
	else
		ls -lahF --color $argv
	end
end
