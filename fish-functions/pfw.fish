# Defined in /tmp/fish.iWjHxs/pfw.fish @ line 2
function pfw
	if not which socat >/dev/null
        echo "Installing socat..."
        which yum >/dev/null
        and sudo yum install -y socat
        which apt >/dev/null
        and sudo apt install -y socat
        which zypper >/dev/null
        and sudo zypper install -y socat
    end
    set destination 3000
    if test (count $argv) = 2
        set destination $argv[2]
    end
    echo "Redirecting incoming traffic targetting port $destination to $argv[1]"
    if test $destination -le 101
        sudo socat -x "tcp-listen:$destination,reuseaddr,fork" "tcp:localhost:$argv[1]"
    else
        socat -x "tcp-listen:$destination,reuseaddr,fork" "tcp:localhost:$argv[1]"
    end
end
