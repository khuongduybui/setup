function x-init
    if which tasklist.exe >/dev/null 2>&1
        and test -x $W/AppData/Local/Microsoft/WindowsApps/x410.exe
        if not tasklist.exe | grep -iq x410
            info 'Launching X-Server'
            eval "nohup (wslpath 'C:\WINDOWS\system32\cmd.exe') /C 'x410.exe /wm' >(mktemp) &"
        end
    else
        echo 'x410 not found.'
    end
end
