# Defined in /tmp/fish.5aSU11/wsl-down.fish @ line 2
function wsl-down
	if __read_confirm --title 'Shut down'
        if test -z $argv[1]
            wsl.exe --list --running
        else
            wsl.exe --terminate $argv[1]
        end
    end
end
