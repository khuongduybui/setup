# Defined in /tmp/fish.2iW7gw/rde-init.fish @ line 1
function rde-init
	sudo /etc/init.d/docker start
  cat /etc/profile.d/docker_host.sh | sed 's/export/set -xg/g' | sed 's/=/ /g' | source
end
