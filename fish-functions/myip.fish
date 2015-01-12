function myip
	if __is_mac
		ifconfig | fgrep inet | grep --color -E " ([0-9a-f]*[\.:]?)+[%a-z0-9]* "
	else
		ifconfig | fgrep inet | grep --color -E "[ :]([0-9a-f]*[.:])+[%a-z0-9/]*[ \$]"
	end
end
