$code = Test-Path "$env:programfiles (x86)/Microsoft VS Code*/code*.exe";
$path = Resolve-Path "$env:programfiles (x86)/Microsoft VS Code*/code*.exe";
if ($code -ne $true) {
  $code = Test-Path "~/Programs/VSCode*/code*.exe";
  $path = Resolve-Path "~/Programs/VSCode*/code*.exe";
}
if ($code -eq $true) {
  Start-Process $path -ArgumentList $args *>$null;
} else {
  notepad $args;
}
