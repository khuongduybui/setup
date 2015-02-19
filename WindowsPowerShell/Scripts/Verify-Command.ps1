param([parameter(mandatory=$true)][string] $command, [switch] $o)
$c = Get-Command $command -ErrorAction SilentlyContinue;
if ($c -eq $null) {
  return $false;
}
if ($o -eq $true) {
  return $c;
}
return $true;
