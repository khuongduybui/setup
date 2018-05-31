# Defined in /tmp/fish.a1JMoE/wsl-down.fish @ line 2
function wsl-down
	echo 'Attempting to shutdown this WSL instance.'
    if __read_confirm
        set servs mongodb rethinkdb dbus
        set existing_servs (service --status-all 2>&1)
        for serv in $servs
            if echo $existing_servs | grep -Fq $serv
                sudo service $serv stop
            end
        end

        if test -f /home/duybui/brazil-pkg-cache/daemon-pid
            set -l pkgcache (string split : (cat /home/duybui/brazil-pkg-cache))[1]
            if test (ps aux | grep $pkgcache | grep -v grep | wc -l) -gt 0
                sudo kill -9 $pkgcache
            end
        end

        which killall >/dev/null; and sudo killall -9 fish
        exit
    end
end
