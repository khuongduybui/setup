param(
    [ValidateSet('forced')] $action
);

Write-Host "Rebuilding OpenFISMA..." -ForegroundColor Red;

Write-Host -NoNewline "Stopping Apache... " -ForegroundColor Yellow;
Stop-Service -displayname "Apache2.4" 2>&1 > $null;
Write-Host "done." -ForegroundColor DarkGreen;
ofs stop;

Write-Host "Initializing OpenFISMA..." -ForegroundColor Yellow;
ofc;

$a = git branch | grep "\* ";
$a = [string]$a;
$a = $a.Substring(2);

rm .\data\logs\*.log;
ofs;

If (($action -eq "forced") -or -not(Test-Path $a".sublime.sql")) {
    cd .\scripts\bin;

    if (Test-Path .\doctrine-cli.php) { php doctrine-cli.php build-all-reload -y sample-data; }
    if (Test-Path .\doctrine.php) { php doctrine.php -rys; }

    Write-Host -NoNewline "Customizing OpenFISMA... " -ForegroundColor Yellow;
    mysql-import openfisma .\local.sublime.sql;
    Write-Host "done." -ForegroundColor DarkGreen;

    php generate-findings.php -n 50;
    php generate-incidents.php -n 50;

    cd ..\..\data\temp;
    mkdir vul_bulk_upload;
    cd ..\..;
    cp .\sample.sublime.nessus .\data\temp\vul_bulk_upload\sample.nessus;
    cd .\scripts\bin;
    php vm_scan_bulk_upload.php -n 1 -u 1 -o 1;

    #php generate-vulnerabilities.php -n 50;
    if (Test-Path .\record-trending.php) { php record-trending.php; }

    cd ..\..;

    Write-Host -NoNewline "Backing up OpenFISMA... " -ForegroundColor Yellow;
    mysql-dump openfisma $a".sublime.sql";
    Write-Host "done." -ForegroundColor DarkGreen;
} else {
    cd .\scripts\bin;

    if (Test-Path .\doctrine-cli.php) { php doctrine-cli.php generate-model-yaml; }
    if (Test-Path .\doctrine.php) { php doctrine.php -m; }

    cd ..\..;

    mysql-import openfisma "empty.sublime.sql";
    mysql-import openfisma $a".sublime.sql";
}
Write-Host "Initializing completed." -ForegroundColor DarkGreen;

Write-Host "Indexing OpenFISMA..." -ForegroundColor Yellow;
cd .\scripts\bin;
php rebuild-index.php -a;
cd ..\..;
Write-Host "Indexing completed." -ForegroundColor DarkGreen;

ofmn;

popd;
Write-Host -NoNewline "Starting Apache... " -ForegroundColor Yellow;
Start-Service -displayname "Apache2.4" 2>&1 > $null;
Write-Host "done." -ForegroundColor DarkGreen;
notify "info" "OpenFISMA" "Rebuild completed.";
