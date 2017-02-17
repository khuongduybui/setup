#! /bin/sh

echo '#! /bin/sh' > ~/bin/rsync-ssh.sh
echo 'rsync -r /mnt/c/Users/duybui/OneDrive/Essentials/dotfile.ssh/* ~/.ssh' >> ~/bin/rsync-ssh.sh
echo 'chmod 600 ~/.ssh/*.pem' >> ~/bin/rsync-ssh.sh
echo 'chmod 600 ~/.ssh/config' >> ~/bin/rsync-ssh.sh
echo 'chmod 644 ~/.ssh/*.pub' >> ~/bin/rsync-ssh.sh
