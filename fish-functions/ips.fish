# Defined in /tmp/fish.PWcy3V/ips.fish @ line 2
function ips
	set -lx AWS_PROFILE $argv[1]
	ada-refresh $argv[1]
	if __is_mac
		/usr/local/bin/fish
	else
		/usr/bin/fish
	end
end
