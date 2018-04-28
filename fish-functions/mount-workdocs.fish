# Defined in /tmp/fish.Y7Fyvh/mount-workdocs.fish @ line 2
function mount-workdocs
	sudo mkdir -p /mnt/w
	sudo mount -t drvfs W: /mnt/w >/dev/null 2>&1; or true
end
