# Fish abbreviations, sourced in ~/.config/fish/config.fish

abbr f 'fuck'
abbr reset-fish 'rm ~/.config/fish/fishd*'
abbr reset-time 'sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime'
abbr update-git 'git remote set-url origin git@bitbucket.org:khuongduybui/linux.git'
abbr byobu 'byobu-launcher -S ~/byobu new-session -A -s default'
abbr awsp 'aws --profile'
abbr ssh-corp 'ssh -o ProxyCommand=None'
abbr rebuild-coral 'clear; begin; set -lx SERVICE (pwe); cd ../"$SERVICE"Model/; brazil-build; cd ../"$SERVICE"Generator/; brazil-build; cd ../"$SERVICE"; brazil-build ser    ver; end'
abbr grep-runtime-log 'grep (brazil-bootstrap)/var/output/logs/* -e'
abbr pickaxe 'ssh -At duybui.aka.amazon.com ssh -t aws-pickaxe-iad-prod-1a-i-24be46da.us-east-1.amazon.com /apollo/env/AWSPickaxeEscritoire/bin/pickaxe'
abbr cra 'cr --all'
abbr lsenv 'l /apollo/env/'
abbr esudo 'sudo -E'
abbr pkg 'ape /apollo/end/SDETools/bin/brazil-build apollo-pkg'
abbr server 'ape /apollo/env/SDETools/bin/brazil-build server'
abbr activate 'aph --status Active'
abbr apd 'apr Deactivate'
abbr apa 'apr Activate'
abbr acc 'accounts'
abbr a 'add-abbr'
abbr d 'dot'
abbr c 'code'
abbr v 'view'
abbr e 'edit'
abbr s 'settings'
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
abbr se 'sudo -E $EDITOR'
abbr gll 'git config --global user.email duy.bui@lunarline.com'
abbr c9color 'set -g theme_color_scheme terminal2-dark-white'
abbr awscc 'git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/'
abbr nm 'ssh um-cli /apollo/bin/env -e envImprovement'
abbr cmd command
abbr region 'aws configure set region'
abbr mongodb 'sudo service mongodb'
abbr rethinkdb 'sudo service rethinkdb'
abbr dbus 'sudo service dbus'
