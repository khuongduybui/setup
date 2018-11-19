function rsync-aws
	mkdir -p ~/.aws
    test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d $WROOT/d/OneDrive; and rsync -r $WROOT/d/OneDrive/Essentials/dotfile.aws/* ~/.aws
    # test -d $WROOT/w/My\ Documents; and rsync -r $WROOT/w/My\ Documents/Essentials/dotfile.aws/* ~/.aws

    if test -f ~/.aws/config
        ls -R ~/.local/lib | grep -q BenderLibIsengard; and sed -i 's/;isengard = isengard.plugin/isengard = isengard.plugin/' ~/.aws/config
        ls -R ~/.local/lib | grep -q GoshawkBotocore; and sed -i 's/;goshawk = goshawk/goshawk = goshawk/' ~/.aws/config
        host duybui.aka.amazon.com >/dev/null; and scp ~/.aws/* duybui.aka.amazon.com:~/.aws/
    end
    echo Done
end
