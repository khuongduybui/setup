function pfw
	if not which socat > /dev/null
		sudo yum install -y socat
	end
	set destination 3000
	if test (count $argv) = 2
		set destination $argv[2]
	end
	echo "Forwarding port $argv[1] to $destination"
	socat "tcp-listen:$argv[1],reuseaddr,fork" "tcp:localhost:$destination"
end
