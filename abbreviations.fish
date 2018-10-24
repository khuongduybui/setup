# Fish abbreviations, sourced in ~/.config/fish/config.fish

# abbr reset-fish 'rm ~/.config/fish/fishd*'
# abbr reset-time 'sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime'
# abbr byobu 'byobu-launcher -S ~/byobu new-session -A -s default'
# abbr awsp 'aws --profile'
abbr ssh-corp 'ssh -o ProxyCommand=None'
abbr ssh-ec2 'ssh -i ~/.ssh/ec2.pem -l ec2-user'
abbr ssh-odin 'ssh -N um-odin'

abbr update-git 'git remote set-url origin git@github.com:khuongduybui/setup.git'

abbr acc 'accounts'
abbr d 'dot'
abbr c 'code'
abbr v 'view'
abbr e 'edit'
abbr se 'sudo -E $EDITOR'
abbr s 'settings'
abbr cmd command

abbr bdf 'bit diff --ignore-space-change'
abbr gdf 'git diff --ignore-space-change'
abbr bdfh 'bit diff --ignore-space-change HEAD'
abbr gdfh 'git diff --ignore-space-change HEAD'
abbr gbD 'git branch -D'
abbr gbd 'git branch -d'
abbr gb 'git branch'
abbr bco 'bit checkout'
abbr gco 'git checkout'
abbr b 'bit status'
abbr g 'git status'
abbr y 'yarn'
abbr gll 'git config --global user.email duy.bui@lunarline.com'
abbr gamz 'git config --global user.email duybui@amazon.com'

abbr awscc 'git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/'
abbr region 'aws configure set region'
abbr lsenv 'l /apollo/env/'

abbr mongodb 'sudo service mongodb'
abbr rethinkdb 'sudo service rethinkdb'
abbr dbus 'sudo service dbus'

abbr fisher-update 'fisher self-update; fisher; patch ~/setup/fish-functions/fish_prompt.fish ~/setup/aps.patch; rm -f ~/setup/fish-functions/fish_greeting.fish'

abbr tpm 'npm install --save --package-lock-only'
abbr tpd 'npm install --save-dev --only=dev'

abbr wlinux-setup 'test -f /etc/setup; and bash /etc/setup'
abbr wlinux-help 'test -f /etc/helpme; and bash /etc/helpme'
abbr nds 'nohup ninja-dev-sync > (mktemp) &'
