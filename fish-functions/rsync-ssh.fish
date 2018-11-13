function rsync-ssh
    mkdir -p ~/.ssh
    test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
    test -d $WROOT/d/OneDrive; and rsync -r $WROOT/d/OneDrive/Essentials/dotfile.ssh/* ~/.ssh
    # test -d $WROOT/w/My\ Documents; and rsync -r $WROOT/w/My\ Documents/Essentials/dotfile.ssh/* ~/.ssh
    chmod 600 ~/.ssh/*.pem
    chmod 600 ~/.ssh/config
    chmod 644 ~/.ssh/*.pub
    chmod 600 ~/.ssh/*.pem-cert.pub
    echo Done
end
