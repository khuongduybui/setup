function myip
	ifconfig | fgrep inet | egrep --color " ([0-9a-f]*[\.:]?)+[%a-z0-9]* "
end
