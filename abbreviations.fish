# Fish abbreviations, sourced in ~/.config/fish/config.fish

abbr my-setup 'curl -L https://gist.github.com/khuongduybui/a6d9d7867a89f304b5b774af9e6e6257/raw/setup.sh | bash -'
abbr fisher-update 'fisher self-update; fisher'
abbr ssh-ec2 'ssh -i ~/.ssh/ec2.pem -l ec2-user'
abbr ssh-raw 'ssh -F /dev/null'
abbr sshp 'ssh -o PreferredAuthentications=password'
abbr update-git 'git remote set-url origin git@github.com:khuongduybui/setup.git'
abbr update-git-ll 'git config user.email "duy.bui@lunarline.com"; git config user.signingkey 083EF93045D6B22C'
abbr update-git-ct 'git config user.email "duy.bui@clevertech.biz"; git config user.signingkey 603790593AB493EA'
abbr update-git-msi 'git config user.email "duy.bui@motorolasolutions.com"; git config user.signingkey F9F596B7934A7B17'
abbr update-font 'curl -s https://api.github.com/repos/adam7/delugia-code/releases/latest | jq -r ".assets[] | select(.name | test(\"omplete.ttf\")) | .browser_download_url" | xargs wget -q -O ~/setup/Delugia.Nerd.Font.Complete.ttf'
abbr rclone-code 'rclone sync ~/code onedrive:code --exclude \'**/node_modules/**/*\' --links'

abbr a 'add-abbr'
abbr acc 'accounts'
abbr bass 'bax'
abbr d 'dot'
abbr c 'c2c'
abbr v 'view'
abbr e 'edit'
abbr s 'settings'
abbr cmd command
abbr cdw 'cd ~/winhome'

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
abbr ya 'yarn add'
abbr yad 'yarn add -D'
abbr ycu yarn upgrade-interactive --latest
abbr p 'pnpm'
abbr px 'pnpx'
abbr pi 'pnpm install'
abbr pid 'pnpm install --save-dev'

abbr azrcc 'git clone git@ssh.dev.azure.com:v3/LunarlineProducts/'

abbr awscc 'git clone codecommit://'
abbr ssm 'aws ssm start-session --document-name AWS-StartInteractiveCommand --parameters command="bash -l" --target'
abbr bsm 'aws ssm start-session --document-name SSM-Bitnami --target'
abbr region 'aws configure set region'
abbr r53-ip 'curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | jq -r \'.prefixes[] | select(.service == "ROUTE53_HEALTHCHECKS") | .ip_prefix\''

abbr snapd 'sudo service snapd'
abbr mongod 'sudo service mongod'
abbr mongodb 'sudo service mongodb'
abbr rethinkdb 'sudo service rethinkdb'
abbr dbus 'sudo service dbus'

abbr fp 'feathers-plus'
abbr fpg 'feathers-plus generate'
abbr fpgs 'feathers-plus generate service'
abbr fpgh 'feathers-plus generate hook'
abbr winget winget.exe
abbr winst winget.exe install
abbr edge microsoft-edge
