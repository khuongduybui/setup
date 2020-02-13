# Defined in /tmp/fish.HwIfyc/rsync-ssh.fish @ line 2
function rsync-ssh
	mkdir -p ~/.ssh

    test -d ~/OneDrive
    and bash ~/setup/backup-and-link.sh ~/OneDrive/Essentials/dotfile.ssh ~/.ssh
    # and rsync -r ~/OneDrive/Essentials/dotfile.ssh/* ~/.ssh

    test -d $WHOME/OneDrive
    and bash ~/setup/backup-and-link.sh $WHOME/OneDrive/Essentials/dotfile.ssh ~/.ssh
    # and rsync -r $WHOME/OneDrive/Essentials/dotfile.ssh/* ~/.ssh

    test -d (wslpath 'D:/OneDrive')
    and bash ~/setup/backup-and-link.sh (wslpath 'D:/OneDrive/Essentials/dotfile.ssh') ~/.ssh
    # and rsync -r (wslpath 'D:/OneDrive/Essentials/dotfile.ssh')/* ~/.ssh

    chmod 600 ~/.ssh/*.private.gpg
    chmod 600 ~/.ssh/*.pem
    chmod 600 ~/.ssh/config
    chmod 644 ~/.ssh/*.public.gpg
    chmod 644 ~/.ssh/*.pub
    chmod 644 ~/.ssh/known_hosts
    chmod 644 ~/.ssh/authorized_keys

    gpg --import ~/.ssh/*.gpg

    echo Done
end
