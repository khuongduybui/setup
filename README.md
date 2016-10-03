To setup a new machine, follow the steps below:

__Step 1__. Set up authentication
```sh
mkdir ~/.ssh
vi ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
vi ~/.ssh/authorized_keys
```

__Step 2__. Install GIT
```sh
sudo apt-get install -y git
```

__Step 3__. Download and run the setup scripts
```sh
git clone git@bitbucket.org:khuongduybui/linux.git ~/setup
sudo visudo
bash ~/setup/setup.sh
```
