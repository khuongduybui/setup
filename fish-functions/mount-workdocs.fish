# Defined in /tmp/fish.4AuBrI/mount-workdocs.fish @ line 2
function mount-workdocs
	sudo mkdir -p /mnt/w 2>/dev/null;
	and sudo mount -t drvfs W: /mnt/w >/dev/null 2>&1;
	or true
end
