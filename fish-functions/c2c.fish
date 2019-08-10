# Defined in /tmp/fish.Tumsnw/c2c.fish @ line 2
function c2c
    if not test -d ~/code
        set_color $fish_color_error
        echo -n "ERROR: "
        set_color normal
        set_color $fish_color_param
        echo -n "code/ "
        set_color $fish_color_error
        echo -n "not found under "
        set_color normal
        set_color $fish_color_param
        echo "~/"
        return
    end
    pushd .
    cd ~/code
    if not test (count $argv) = 0
        if not test -d ./$argv[1]
            set_color $fish_color_error
            echo -n "ERROR: "
            set_color normal
            set_color $fish_color_param
            echo -n "$argv[1]/ "
            set_color $fish_color_error
            echo -n "not found under "
            set_color normal
            set_color $fish_color_param
            echo "~/code/"
            set_color normal
        else
            cd $argv[1]
            set -xg DEBUG "*$argv[1]*:*"
            if test (count $argv) -gt 1
                cd ./(command ls | command grep --color=none -i $argv[2..-1])
            else if test (count (command ls)) = 1
                cd (command ls)
            end
        end
    end
    if test -d ./.git
        git status
    else
        l
    end
    if test -f ./env/bin/activate.fish
        . ./env/bin/activate.fish
    end
end
