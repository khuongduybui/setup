# Defined in /tmp/fish.H7wLFw/ops.fish @ line 2
function ops
	set -lx ODIN_GET_BIN
    if test -x /apollo/env/envImprovement/bin/odin-get
        set -x ODIN_GET_BIN "/apollo/env/envImprovement/bin/odin-get"
    else
        if getent hosts duybui.aka.amazon.com >/dev/null
            set -x ODIN_GET_BIN "ssh duybui.aka.amazon.com /apollo/env/envImprovement/bin/odin-get"
        else
            echo "odin-get not found."
            return -1
        end
    end

    set -lx OPS $argv[1]
    set -lx AWS_ACCESS_KEY_ID (eval "$ODIN_GET_BIN -t Principal $argv[1]")
    set -lx AWS_SECRET_ACCESS_KEY (eval "$ODIN_GET_BIN -t Credential $argv[1]")

    if __is_mac
        /usr/local/bin/fish
    else
        /usr/bin/fish
    end
end
