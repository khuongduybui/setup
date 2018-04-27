# Defined in /tmp/fish.SoK5J4/mount-workdocs.fish @ line 1
function mount-workdocs
	sudo mkdir -p /mnt/w
	sudo mount -t drvfs W: /mnt/w
end
