pushd;
cd ~\OneDrive\Essentials;
$files = Get-ChildItem -force | Where-Object {$_.NAME -match "(^[\._])|(\.js$)"};
cd ~;
foreach ($file in $files) {
    $f = $file.Name;
    if (Test-Path ~\$f) {
        #don't do anything
    } else {
        if ($file.Attributes -match "Directory") {
            mklink /D $f OneDrive\Essentials\$f;
        } else {
            mklink $f OneDrive\Essentials\$f;
        }
    }
}
popd;
