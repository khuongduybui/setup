function rsync-aws
	mkdir -p ~/.aws
    test -d ~/OneDrive; and rsync -r ~/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d $WHOME/OneDrive; and rsync -r $WHOME/OneDrive/Essentials/dotfile.aws/* ~/.aws
    test -d (wslpath 'D:/OneDrive'); and rsync -r (wslpath 'D:/OneDrive/Essentials/dotfile.aws')/* ~/.aws
    # test -d (wslpath 'W:/My\ Documents'); and rsync -r (wslpath 'W:/My\ Documents/Essentials/dotfile.aws')/* ~/.aws

    if test -f ~/.aws/config
        ls -R ~/.local/lib | grep -q BenderLibIsengard; and sed -i 's/;isengard = isengard.plugin/isengard = isengard.plugin/' ~/.aws/config
        ls -R ~/.local/lib | grep -q GoshawkBotocore; and sed -i 's/;goshawk = goshawk/goshawk = goshawk/' ~/.aws/config
        getent hosts duybui.aka.amazon.com >/dev/null; and scp ~/.aws/* duybui.aka.amazon.com:~/.aws/
    end
    echo Done
end
