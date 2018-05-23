# Defined in /tmp/fish.M4dDKo/wsl-down.fish @ line 2
function wsl-down
	echo 'Attempting to shutdown this WSL instance.'
	if __read_confirm
		sudo service mongodb stop
		sudo service rethinkdb stop

		sudo service dbus stop

        if test -f /home/duybui/brazil-pkg-cache/daemon-pid
            set -l pkgcache (string split : (cat /home/duybui/brazil-pkg-cache))[1]
		    if test (ps aux | grep $pkgcache | grep -v grep | wc -l) -gt 0
		        sudo kill -9 $pkgcache
		    end
		end

		exit
	end
end
