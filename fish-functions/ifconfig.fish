function ifconfig
	if test (which ifconfig)
		command ifconfig $argv
	else
		sudo /sbin/ifconfig $argv
	end
end
