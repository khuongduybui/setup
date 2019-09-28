# Fish abbreviations, sourced in ~/.config/fish/config.fish

abbr fisher-update 'fisher self-update; fisher'
abbr update-git 'git remote set-url origin git@github.com:khuongduybui/setup.git'
abbr ssh-ec2 'ssh -i ~/.ssh/ec2.pem -l ec2-user'
abbr update-git-ll 'git config user.email "duy.bui@lunarline.com"; git config user.signingkey 083EF93045D6B22C'
abbr update-git-ct 'git config user.email "duy.bui@clevertech.biz"; git config user.signingkey 603790593AB493EA'

abbr a 'add-abbr'
abbr acc 'accounts'
abbr bass 'bax'
abbr d 'dot'
abbr c 'c2c'
abbr v 'view'
abbr e 'edit'
abbr s 'settings'
abbr cmd command
abbr cdw 'cd $WHOME'

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
abbr bl 'bit lg'
abbr gl 'git lg'
abbr b 'bit status'
abbr g 'git status'
abbr y 'yarn'
abbr yx 'yarn exec'
abbr p 'pnpm'
abbr px 'pnpx'
abbr pi 'pnpm install'
abbr pid 'pnpm install --save-dev'

abbr azrcc 'git clone git@ssh.dev.azure.com:v3/LunarlineProducts/'

abbr awscc 'git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/'
abbr ssm 'aws ssm start-session --target'
abbr region 'aws configure set region'

abbr snapd 'sudo service snapd'
abbr mongod 'sudo service mongod'
abbr mongodb 'sudo service mongodb'
abbr rethinkdb 'sudo service rethinkdb'
abbr dbus 'sudo service dbus'

abbr heroku 'snap run heroku'

abbr fp 'feathers-plus'
abbr fpg 'feathers-plus generate'
abbr fpgs 'feathers-plus generate service'
abbr fpgh 'feathers-plus generate hook'

abbr docker 'sudo docker'
