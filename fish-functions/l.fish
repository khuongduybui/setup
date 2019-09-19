# Defined in /tmp/fish.BcmDnW/l.fish @ line 2
function l
	if which lsd >/dev/null 2>&1
        lsd -lA $argv
    else
        if __is_mac
            ls -laGhF $argv
        else
            ls -lahF --color $argv
        end
    end
end
