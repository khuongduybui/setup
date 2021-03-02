# Defined in /tmp/fish.B0sXyf/settings.fish @ line 2
function settings
    if test (count $argv) = 0
        edit ~/setup/config.fish
        reload
    else
        funced -e "$EDITOR" $argv
        funcsave $argv
    end
end
