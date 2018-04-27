# Defined in /tmp/fish.R4A2TA/wsl-down.fish @ line 2
function wsl-down
	echo 'Attempting to shutdown this WSL instance.'
	if __read_confirm
		sudo service mongodb stop
		sudo service rethinkdb stop
		sudo service dbus stop
		exit
	end
end
