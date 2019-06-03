# #! /bin/bash

backup-and-link() {
    source="$1"
    destination="$2"
    [[ $2 =~ /$ ]] && destination="$2`basename $1`"
    rm -rf "$destination.`date +%Y-%m-%d`.bak"
    test -e "$destination" && mv "$destination" "$destination.`date +%Y-%m-%d`.bak"
    ln -s "$source" "$destination"
}

echo "--- Install package manager ---"
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
curl -L https://download.opensuse.org/repositories/utilities/RHEL_7/utilities.repo | sudo tee /etc/yum.repos.d/opensuse-utilities.repo

echo "--- Install system utils ---"
# fish, jq provided by envImprovement
sudo yum install -y byobu

echo "---Install dev tools---"
sudo yum install -y python2 python2-pip
# nodejs provided by NodeJS
sudo /apollo/env/NodeJS/bin/npm install -g yarn
# no jdk
# pythons (no pips) provided by envImprovement

# rubyenv provided by envImprovement
bash ~/setup/al2-aws-ssm.sh
# # yum install -y w3m

echo "---Update system---"
sudo yum update -y
backup-and-link ~/setup/rhel.zprofile ~/.zprofile
