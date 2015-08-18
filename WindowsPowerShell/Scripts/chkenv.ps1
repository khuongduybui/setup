clear;
Write-Host "Checking full environments..." -ForegroundColor Yellow;

Write-Host "Verifying applications.." -ForegroundColor Yellow;
Sysinternals-Init;
# Verify-Choco atom > $null;
# Verify-Choco SublimeText3 > $null;
Verify-Choco picasa > $null;
Verify-Choco calibre > $null;
Verify-Choco audacity > $null;
Verify-Choco javaruntime > $null;

Write-Host "Verifying Languages..." -ForegroundColor Yellow;
# Verify-Choco ruby > $null;
Verify-Choco python2 > $null;Verify-Path "$env:SystemDrive\Python27"; Verify-Path "$env:SystemDrive\Python27\Scripts";
# Verify-Choco perl > $null;
Verify-Choco io.js > $null;
Verify-Choco jdk8 > $null;
# Verify-Choco golang > $null;

Write-Host "Verifying VCSs..." -ForegroundColor Yellow;
Verify-Choco git.install > $null;
# Verify-Choco hg > $null;
# Verify-Choco svn > $null;

Write-Host "Verifying DBMSes..." -ForegroundColor Yellow;
Verify-Choco HeidiSQL > $null;
# Verify-Choco redis > $null;
Verify-Choco mongodb > $null;
Verify-Choco robomongo > $null;

Write-Host "Verifying dev tools..." -ForegroundColor Yellow;
Verify-Choco ant > $null;
Verify-Path "~\AppData\Roaming\npm";
Verify-Npm mocha > $null;
Verify-Npm cordova > $null;
Verify-Npm express -package express-generator > $null;
Verify-Npm nodemon > $null;

#Xampp-Init;
#Bitnami-Init;
#Android-Init;

Write-Host "Done." -ForegroundColor Yellow;
cd ~;
