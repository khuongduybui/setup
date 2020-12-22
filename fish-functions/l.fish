# Defined in /tmp/fish.glF7Ql/l.fish @ line 2
function l
    if type -q exa
        exa -lagh --time-style=long-iso $argv
    else if type -q lsd
        lsd -lA $argv
    else
        if __is_mac
            ls -laGhF $argv
        else
            ls -lahF --color $argv
        end
    end
end
