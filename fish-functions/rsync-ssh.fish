# Defined in /tmp/fish.QqRcnu/rsync-ssh.fish @ line 2
function rsync-ssh
    mkdir -p ~/.ssh

    test -d ~/OneDrive
    and rsync -r ~/OneDrive/Essentials/dotfile.ssh/* ~/.ssh

    test -d $WHOME/OneDrive
    and rsync -r $WHOME/OneDrive/Essentials/dotfile.ssh/* ~/.ssh

    test -d (wslpath 'D:/OneDrive')
    and rsync -r (wslpath 'D:/OneDrive/Essentials/dotfile.ssh')/* ~/.ssh

    chmod 600 ~/.ssh/*.pem
    chmod 600 ~/.ssh/config
    chmod 644 ~/.ssh/*.pub
    chmod 644 ~/.ssh/known_hosts
    chmod 644 ~/.ssh/authorized_keys

    echo Done
end
