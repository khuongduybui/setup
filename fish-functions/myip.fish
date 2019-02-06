# Defined in /tmp/fish.uTlQbQ/myip.fish @ line 2
function myip
	which curl >/dev/null 2>&1; and segment blue white " External IP "; and segment_close; and curl -s https://www.myexternalip.com/raw | grep .
	segment blue white " Internal IP "; segment_close; echo;
	if which ip >/dev/null 2>&1
	  ip address | grep inet
	else
    if __is_mac
		  ifconfig | fgrep inet | grep --color -E " ([0-9a-f]*[\.:]?)+[%a-z0-9]* "
  	else
  		ifconfig | fgrep inet | grep --color -E "[ :]([0-9a-f]*[.:])+[%a-z0-9/]*[ \$]"
	  end
  end
end
