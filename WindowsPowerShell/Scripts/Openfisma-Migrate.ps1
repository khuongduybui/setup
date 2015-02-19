param($file);
Write-Host "Migrating to $file..." -ForegroundColor Yellow;
ofc;

Write-Host "Preparing database..." -ForegroundColor Yellow;
mysql-import openfisma empty.sublime.sql;
mysql-import openfisma $file".sublime.sql";
Write-Host "Preparing completed." -ForegroundColor DarkGreen;

Write-Host "Executing migration..." -ForegroundColor Yellow;
cd .\scripts\bin;
php migrate.php;
cd ..\..;
Write-Host "Migrating completed." -ForegroundColor DarkGreen;

Write-Host "Customizing OpenFISMA..." -ForegroundColor Yellow;
mysql-import openfisma .\local.sublime.sql;
Write-Host "Customizing completed." -ForegroundColor DarkGreen;

popd;
Write-Host "Migrating completed." -ForegroundColor DarkGreen;
