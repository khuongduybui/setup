# Defined in /tmp/fish.8JMxfM/ips.fish @ line 1
function ips
	echo "Using profile $argv[1]"
	set -lx AWS_PROFILE $argv[1]
	if __is_mac
		/usr/local/bin/fish
	else
		/usr/bin/fish
	end
end
