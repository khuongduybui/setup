param(
    [ValidateSet('forced')] $action
);

Write-Host "Minifying OpenFISMA..." -ForegroundColor Yellow;
ofc;

cd .\scripts\build\bin;
mv yuicompressor.jar yuicompressor.jar.bak;
cp yuicompressor-2.4.2.jar yuicompressor.jar;
cd ..;
if ($action -eq "forced") { ant clean minify; } else { ant minify; }
cd .\bin;
rm yuicompressor.jar;
mv yuicompressor.jar.bak yuicompressor.jar;

popd;
Write-Host "Minifying completed." -ForegroundColor DarkGreen;
