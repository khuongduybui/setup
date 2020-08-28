# Defined in /tmp/fish.glF7Ql/l.fish @ line 2
function l
    if which exa >/dev/null 2>&1
        exa -lagh --time-style=long-iso $argv
    else if which lsd >/dev/null 2>&1
        lsd -lA $argv
    else
        if __is_mac
            ls -laGhF $argv
        else
            ls -lahF --color $argv
        end
    end
end
