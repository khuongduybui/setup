function rsync-ssh
    mkdir -p ~/.ssh
    test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
    test -d (wslpath 'D:/OneDrive'); and rsync -r (wslpath 'D:/OneDrive/Essentials/dotfile.ssh')/* ~/.ssh
    chmod 600 ~/.ssh/*.pem
    chmod 600 ~/.ssh/config
    chmod 644 ~/.ssh/*.pub
    chmod 600 ~/.ssh/*.pem-cert.pub
    echo Done
end
