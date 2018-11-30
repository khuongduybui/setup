function wsl-down
	if test -z $argv[1]
        wslconfig.exe /list
    else
        wslconfig.exe /terminate $argv[1]
    end
end
