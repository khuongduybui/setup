param([parameter(mandatory=$true)][string] $file, $destination)
if ((Test-Path $file) -eq $false) {
  Write-Host "$file not found." -ForegroundColor Red;
  return $null;
}
if (($destination -eq $null) -or ((Test-Path $destination) -eq $false)) {
  Write-Host "destination not supplied or not found. Using current working directory instead." -ForegroundColor DarkYellow;
  $destination = pwd;
}
$shell = New-Object -com shell.application;
$p = (Resolve-Path $file).Path;
$dp = (Resolve-Path $destination).Path;
foreach ($item in $shell.NameSpace($p).items()) {
  $shell.Namespace($dp).copyhere($item);
}
