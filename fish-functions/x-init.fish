# Defined in /tmp/fish.YLWCGz/x-init.fish @ line 2
function x-init
    if type -q x410.exe; and type -q tasklist.exe
        if not tasklist.exe /fi "imagename eq x410.exe" | grep -iq x410
            info 'Launching X-Server'
            x410.exe /wm &
        end
    else
        echo 'x410 not found.'
    end
end
