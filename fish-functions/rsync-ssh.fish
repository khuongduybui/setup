# Defined in /tmp/fish.IhG9PL/rsync-ssh.fish @ line 2
function rsync-ssh
	mkdir -p ~/.ssh
	test -d /mnt/$WDRIVE/Users/$WUSER/OneDrive; and rsync -r /mnt/$WDRIVE/Users/$WUSER/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d /mnt/w/My\ Documents; and rsync -r /mnt/w/My\ Documents/Essentials/dotfile.ssh/* ~/.ssh
	chmod 600 ~/.ssh/*.pem
	chmod 600 ~/.ssh/config
	chmod 644 ~/.ssh/*.pub
	chmod 600 ~/.ssh/*.pem-cert.pub
end
