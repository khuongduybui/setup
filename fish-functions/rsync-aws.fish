# Defined in /tmp/fish.Aoa8E9/rsync-aws.fish @ line 2
function rsync-aws
    mkdir -p ~/.aws
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d /mnt/d/OneDrive; and rsync -r /mnt/d/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d /mnt/w/My\ Documents; and rsync -r /mnt/w/My\ Documents/Essentials/dotfile.aws/* ~/.aws
end
