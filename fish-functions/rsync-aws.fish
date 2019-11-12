# Defined in /tmp/fish.X0qdGd/rsync-aws.fish @ line 2
function rsync-aws
	test -d ~/OneDrive
    and bash ~/setup/backup-and-link.sh ~/OneDrive/Essentials/dotfile.aws ~/.aws

    test -d $WHOME/OneDrive
    and bash ~/setup/backup-and-link.sh $WHOME/OneDrive/Essentials/dotfile.aws ~/.aws

    test -d (wslpath 'D:/OneDrive')
    and bash ~/setup/backup-and-link.sh (wslpath 'D:/OneDrive/Essentials/dotfile.aws') ~/.aws

    chmod 644 ~/.aws/*

    echo Done
end
