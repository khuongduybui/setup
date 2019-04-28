# Fish abbreviations, sourced in ~/.config/fish/config.fish

# abbr reset-fish 'rm ~/.config/fish/fishd*'
# abbr reset-time 'sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime'
# abbr byobu 'byobu-launcher -S ~/byobu new-session -A -s default'
# abbr awsp 'aws --profile'
abbr ssh-corp 'ssh -o ProxyCommand=None'
abbr ssh-ec2 'ssh -i ~/.ssh/ec2.pem -l ec2-user'
abbr ssh-odin 'ssh -N um-odin'

abbr update-git 'git remote set-url origin git@github.com:khuongduybui/setup.git'

abbr a add-abbr
abbr acc 'accounts'
abbr d 'dot'
abbr c 'c2c'
abbr v 'view'
abbr e 'edit'
abbr se 'eval "sudo -E $EDITOR --user-data-dir $HOME"'
abbr s 'settings'
abbr cmd command

abbr bdf 'bit diff --ignore-space-change'
abbr gdf 'git diff --ignore-space-change'
abbr bdft 'git difftool -y --ignore-space-change'
abbr gdft 'git difftool -y --ignore-space-change'
abbr gbe git checkout --orphan
abbr gb 'git branch'
abbr gbr 'git branch -r'
abbr gbD 'git branch -D'
abbr gbd 'git branch -d'
abbr gbdr 'git push --delete origin'
abbr bco 'bit checkout'
abbr gco 'git checkout'
abbr b 'bit status'
abbr g 'git status'
abbr y 'yarn'
abbr gll 'git config --global user.email duy.bui@lunarline.com'
abbr gamz 'git config --global user.email duybui@amazon.com'

abbr azrcc 'git clone git@ssh.dev.azure.com:v3/LunarlineProducts/'

abbr awscc 'git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/'
abbr ssm 'aws ssm start-session --target'
abbr region 'aws configure set region'
abbr lsenv 'l /apollo/env/'
abbr nds 'killall -9 ninja-dev-sync 2>/dev/null; nohup ~/.toolbox/bin/ninja-dev-sync > (mktemp) &'

abbr mongodb 'sudo service mongodb'
abbr rethinkdb 'sudo service rethinkdb'
abbr dbus 'sudo service dbus'

abbr fisher-update 'fisher self-update; fisher; patch ~/setup/fish-functions/fish_prompt.fish ~/setup/aps.patch; rm -f ~/setup/fish-functions/fish_greeting.fish'

abbr tpm 'npm install --save --package-lock-only'
abbr tpd 'npm install --save-dev --only=dev'

abbr wlinux-setup 'test -f /etc/setup; and bash /etc/setup'
abbr wlinux-help 'test -f /etc/helpme; and bash /etc/helpme'
abbr cdw 'cd $WHOME'

abbr fp feathers-plus
abbr fpg feathers-plus generate
abbr fpgs feathers-plus generate service
abbr fpgh feathers-plus generate hook
