$Profile = $myInvocation.mycommand.path
#init
#Global Functions
function    ..              { cd ..; }
function    ...             { cd ..\..; }
function    la              { Get-ChildItem -force $args; }
Set-Alias   l               ls
Set-Alias   ll              la
Set-Alias   e               atom
Set-Alias   grep            Select-String
Set-Alias   which           Get-Command
Set-Alias   run             Start-Process
Set-Alias   tor             Fetch-Torrent
Set-Alias   acc             Accounts
Set-Alias   sup             Supervisor-App
Set-Alias   reload          Environment-Init
function    mklink          { cmd /c mklink $args; }
function    bcopy           { cmd /c copy /b $args; }
function    myip            { ipconfig | gawk "/(adapter|IPv4 Address)/"; }

#Google-App-Engine Functions
Set-Alias   gphp            Gapp-Php

#XAMPP Functions
function    mysql-root      { mysql --user=root $args; }

#GIT Functions
function    g               { git status $args; }
function    gb              { git branch $args; }
function    gst             { git status $args; }
function    gco             { git checkout $args; }
function    gdf             { git diff --ignore-space-change $args; }
function    gbd             { git branch -D $args; }

#Node Functions
function    ninst           { npm install $args; }
function    ninsts          { npm install --save $args; }
function    nup             { npm update $args; }
function    nups            { npm update --save $args; }
Set-Alias   ver             Get-Version

#SSH Functions
function    ssh-me          { pushd; cd ~/OneDrive/Essentials/; ssh -i .ssh/id_rsa          -l duybui   $args; popd; }
function    scp-me          { pushd; cd ~/OneDrive/Essentials/; scp -i .ssh/id_rsa          -l duybui   $args; popd; }
function    ssh-support     { pushd; cd ~/OneDrive/Essentials/; ssh -i .ssh/support_rsa     -l support  $args; popd; }
function    scp-support     { pushd; cd ~/OneDrive/Essentials/; scp -i .ssh/support_rsa     -l support  $args; popd; }
function    ssh-techsupport { pushd; cd ~/OneDrive/Essentials/; ssh -i .ssh/techsupport_rsa -l support  $args; popd; }
function    scp-techsupport { pushd; cd ~/OneDrive/Essentials/; scp -i .ssh/techsupport_rsa -l support  $args; popd; }
function    ssh-ec2         { pushd; cd ~/OneDrive/Essentials/; ssh -i .ssh/amazonec2_rsa   -l ubuntu   $args; popd; }

function    www             { ssh-me dbui@208.49.138.29; }
function    sharky          { ssh-me duy.bui@208.49.138.18; }
function    dogfood         { ssh-support 192.168.0.174; }
function    ghetto          { ssh-me duy.bui@192.168.0.49; }
function    fsap-admin      { ssh admin:Sc4>Pk9^Pu@10.59.92.16; }
function    fsap            { ssh-me dbui@10.59.92.16; }
function    fsat            { ssh-me dbui@10.59.94.97; }
function    fdicp           { ssh-me -R 9418:git.openfisma.org:9418 dbui@10.28.78.135; }
function    fdict           { ssh-me -R 9418:git.openfisma.org:9418 dbui@10.28.78.136; }
function    ec2             { ssh-ec2 ec2.buifamily.info; }
function    sniper1         { ssh-me sniper@sniper-test01.lunarlinelabs.net; }
function    sniper2         { ssh-me sniper@sniper-test02.lunarlinelabs.net; }

#OpenFISMA Functions
Set-Alias   ofrb            Openfisma-Rebuild
Set-Alias   ofmn            Openfisma-Minify
Set-Alias   ofmigrate       Openfisma-Migrate
function    ofsql           { ofc; mysql-root openfisma; popd; }
Set-Alias   ofjsl           Openfisma-Jslint
Set-Alias   ofcs            Openfisma-Codesniffer
Set-Alias   ofs             Openfisma-Solr

#SCAPSync Functions
Set-Alias   sss             Scapsync-Solr
Set-Alias   ssu             Scapsync-Update

$env:Path += ";$(Split-Path $profile)\Scripts"
Environment-Init
