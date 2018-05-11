# Defined in /tmp/fish.QeLHdE/ops.fish @ line 2
function ops
	if not test -x /apollo/env/envImprovement/bin/odin-get
	    echo "odin-get not found."
	    return -1
    end
    echo "Using credentials from https://odin.amazon.com/#view/materialSet/$argv[1]"
    set -lx OPS $argv[1]
    set -lx AWS_ACCESS_KEY_ID (/apollo/env/envImprovement/bin/odin-get -t Principal $argv[1])
    set -lx AWS_SECRET_ACCESS_KEY (/apollo/env/envImprovement/bin/odin-get -t Credential $argv[1])
    if __is_mac
        /usr/local/bin/fish
    else
        /usr/bin/fish
    end
end
