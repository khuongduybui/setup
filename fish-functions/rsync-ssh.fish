# Defined in /tmp/fish.D0FnbC/rsync-ssh.fish @ line 1
function rsync-ssh
	test -d /mnt/c/Users/duybui/OneDrive; and rsync -r /mnt/c/Users/duybui/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
	chmod 600 ~/.ssh/*.pem
	chmod 600 ~/.ssh/config
	chmod 644 ~/.ssh/*.pub
	chmod 600 ~/.ssh/*.pem-cert.pub
end
