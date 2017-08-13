#! /bin/sh

echo '#! /bin/sh' > ~/bin/rsync-ssh.sh
echo 'test -d /mnt/c/Users/duybui/OneDrive && rsync -r /mnt/c/Users/duybui/OneDrive/Essentials/dotfile.ssh/* ~/.ssh' >> ~/bin/rsync-ssh.sh
echo 'test -d /mnt/d/OneDrive && rsync -r /mnt/d/OneDrive/Essentials/dotfile.ssh/* ~/.ssh' >> ~/bin/rsync-ssh.sh
echo 'chmod 600 ~/.ssh/*.pem' >> ~/bin/rsync-ssh.sh
echo 'chmod 600 ~/.ssh/config' >> ~/bin/rsync-ssh.sh
echo 'chmod 644 ~/.ssh/*.pub' >> ~/bin/rsync-ssh.sh
bash ~/bin/rsync-ssh.sh

sudo apt install -y mc screenfetch
sudo chmod 664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

test -d /mnt/c/Users/duybui/code/sniper && bash ~/setup/ubuntu-win-sniper.sh
