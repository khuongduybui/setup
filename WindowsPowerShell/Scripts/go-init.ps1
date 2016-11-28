Verify-Bin "go";
$goBinPath = (Verify-Command -o "go").Path;
$env:GOPATH = Resolve-Path "$goBinPath/..";
$env:GOROOT = Resolve-Path "$goBinPath/../..";
