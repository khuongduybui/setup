# Defined in /tmp/fish.zJ1uQW/wsl-down.fish @ line 2
function wsl-down
    if __read_confirm --title 'Shut down'
        if test -z $argv[1]
            wsl.exe --shutdown
        else
            wsl.exe --terminate $argv[1]
        end
    end
end
