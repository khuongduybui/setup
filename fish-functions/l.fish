function l
	if __is_mac
		command ls -laGhF $argv
	else
		command ls -lahF --color $argv
	end
end
