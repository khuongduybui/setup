function wsl-down
	if __read_confirm --title 'Shut down'
        if test -z $argv[1]
            wslconfig.exe /list
        else
            wslconfig.exe /terminate $argv[1]
        end
    end
end
