# Defined in /tmp/fish.rjxNk2/pfw.fish @ line 2
function pfw
	if not which socat >/dev/null
		which yum >/dev/null; and sudo yum install -y socat
		which apt >/dev/null; and sudo apt install -y socat
	end
	set destination 3000
	if test (count $argv) = 2
		set destination $argv[2]
	end
	echo "Forwarding port $argv[1] to $destination"
	sudo socat "tcp-listen:$argv[1],reuseaddr,fork" "tcp:localhost:$destination"
end
