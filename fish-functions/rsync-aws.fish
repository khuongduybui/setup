function rsync-aws
    mkdir -p ~/.aws
    test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d $WROOT/d/OneDrive; and rsync -r $WROOT/d/OneDrive/Essentials/dotfile.aws/* ~/.aws
    # test -d $WROOT/w/My\ Documents; and rsync -r $WROOT/w/My\ Documents/Essentials/dotfile.aws/* ~/.aws
    echo Done
end
