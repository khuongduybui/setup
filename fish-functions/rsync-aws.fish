# Defined in /tmp/fish.oik5gT/rsync-aws.fish @ line 2
function rsync-aws
    mkdir -p ~/.aws

    test -d ~/OneDrive
    and rsync -r ~/OneDrive/Essentials/dotfile.aws/* ~/.aws

    test -d $WHOME/OneDrive
    and rsync -r $WHOME/OneDrive/Essentials/dotfile.aws/* ~/.aws

    test -d (wslpath 'D:/OneDrive')
    and rsync -r (wslpath 'D:/OneDrive/Essentials/dotfile.aws')/* ~/.aws

    chmod 644 ~/.aws/*

    echo Done
end
