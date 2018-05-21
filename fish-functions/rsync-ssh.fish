# Defined in /var/folders/dz/y2q7pw153pz7gm62rj5n25_9qzr_wy/T//fish.Wfy1o7/rsync-ssh.fish @ line 2
function rsync-ssh
	mkdir -p ~/.ssh
	test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d /mnt/w/My\ Documents; and rsync -r /mnt/w/My\ Documents/Essentials/dotfile.ssh/* ~/.ssh
	chmod 600 ~/.ssh/*.pem
	chmod 600 ~/.ssh/config
	chmod 644 ~/.ssh/*.pub
	chmod 600 ~/.ssh/*.pem-cert.pub
end
