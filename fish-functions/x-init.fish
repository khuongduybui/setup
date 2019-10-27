# Defined in /tmp/fish.5j32cq/x-init.fish @ line 2
function x-init
	if which tasklist.exe >/dev/null 2>&1
        and test -x $W/AppData/Local/Microsoft/WindowsApps/x410.exe
        if not tasklist.exe | grep -iq x410
            info 'Launching X-Server'
            cmd.exe /C 'x410.exe /wm'
        end
    else
        echo 'x410 not found.'
    end
end
