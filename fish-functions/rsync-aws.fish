# Defined in /tmp/fish.UtXdph/rsync-aws.fish @ line 1
function rsync-aws
	test -d /mnt/c/Users/duybui/OneDrive; and rsync -r /mnt/c/Users/duybui/OneDrive/Essentials/dotfile.aws/* ~/.aws
	test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.aws/* ~/.aws
end
