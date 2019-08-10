# Defined in /tmp/fish.63scBh/execute_bit.fish @ line 2
function execute_bit
    segment white magenta (__fish_git_prompt)' '
    segment white blue ' '(basename (pwd))' '
    segment_close

    echo -n git' '
    set_color cyan
    echo $argv
    set_color normal

    git $argv
    echo
end
