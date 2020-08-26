# Defined in /tmp/fish.n7YcaK/cat.fish @ line 1
function cat
    if which bat >/dev/null 2>&1
        bat $argv
    else
        command cat $argv
    end
end
