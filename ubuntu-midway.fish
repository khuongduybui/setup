sudo apt-get install amazon-chromium-config amazon-chrome-certs
sudo ln -s /etc/chromium-browser /etc/chromium

sudo apt-get update && sudo apt-get upgrade && sudo apt-get install opensc gnupg-agent gnupg-pkcs11-scd p11-kit libengine-pkcs11-openssl libccid pcscd
curl "https://s3.amazonaws.com/com.amazon.aws.midway.software/amazon-smart-card_1.0_amd64.deb" > ~/amazon-smart-card.deb
sudo dpkg -i ~/amazon-smart-card.deb

sudo usermod -a -G pcscd duybui
sudo update-rc.d pcscd defaults
sudo service pcscd start

sudo apt-get install libnss3-tools
certutil -U -d sql:$HOME/.pki/nssdb
modutil -add "midway" -libfile libeToken.so.8 -dbdir sql:$HOME/.pki/nssdb
modutil -list "midway" -dbdir sql:$HOME/.pki/nssdb
modutil -enable "midway" -dbdir sql:$HOME/.pki/nssdb
certutil -U -d sql:$HOME/.pki/nssdb
certutil -L -h "midway" -d sql:$HOME/.pki/nssdb

curl https://security-bastions.amazon.com/noauth/bastions/prod/security-bastion-setup.sh | /bin/bash
sed -i -e 's/`host/(host/' -e 's/-f5`/-f5)/' ~/.config/ssh
