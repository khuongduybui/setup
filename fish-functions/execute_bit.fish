function execute_bit
    set_color -b blue white
    echo -n ' '(basename (pwd))' '
    set_color -b magenta blue
    echo -n \uE0B0
    set_color -b magenta white
    echo -n (__fish_git_prompt)' '
    set_color -b normal magenta
    echo -n \uE0B0
    set_color normal
    echo -n ' 'git' '
    set_color cyan
    echo -n $argv
    set_color normal
    echo
    git $argv
    echo
end
