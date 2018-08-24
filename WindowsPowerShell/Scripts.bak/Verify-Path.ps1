param([switch] $v, [string] $path);

if ((Test-Path $path) -ne $True) {
  if ($v -eq $True) {
    Write-Host "$path not found." -ForegroundColor Red;
  }
  return $False;
}

$path = Resolve-Path $path;
if ((Write-Output $env:PATH | Select-String -Pattern $path -Quiet -SimpleMatch) -ne $true) {
  $env:PATH += ";$path"
}
[Environment]::SetEnvironmentVariable("PATH", $env:PATH, "User")
return $True;