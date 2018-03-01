# Defined in /tmp/fish.EEmCB1/rsync-aws.fish @ line 2
function rsync-aws
	test -d /mnt/c/Users/$WUSER/OneDrive; and rsync -r /mnt/c/Users/$WUSER/OneDrive/Essentials/dotfile.aws/* ~/.aws
	test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.aws/* ~/.aws
end
