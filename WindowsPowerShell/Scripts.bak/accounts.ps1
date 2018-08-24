param($keyword);

Push-Location;
Set-Location $SyncRoot;

if ($null -eq $keyword) {
  e $(Resolve-Path ".\Essentials\accounts.ini");
} else {
  Get-Content .\Essentials\accounts.ini | gawk "/$keyword/";
  Get-Content .\Essentials\accounts.ini | gawk "/$keyword.*\{/,/\}/";
}

Pop-Location;
