$Profile = $myInvocation.mycommand.path
#init
#Global Functions
function    ..              { cd ..; }
function    ...             { cd ..\..; }
function    la              { Get-ChildItem -force $args; }
Set-Alias   l               ls
Set-Alias   ll              la
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
function    ssh-ec2         { pushd; cd ~/OneDrive/Essentials/; ssh -i .ssh/openfisma-ec2.pem   -l ubuntu   $args; popd; }

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

$env:Path += ";$(Split-Path $Profile)\Scripts"
Environment-Init
