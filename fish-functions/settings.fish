# Defined in /tmp/fish.SSXkN7/settings.fish @ line 2
function settings
    if test (count $argv) = 0
        edit ~/setup/config.fish
        reload
    else if test -e ~/setup/shell-utils/scripts/$argv[1].ts
        command script-settings $argv
    else
        funced -e "$EDITOR" -s $argv
    end
end
