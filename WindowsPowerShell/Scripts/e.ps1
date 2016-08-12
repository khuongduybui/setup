$code = Test-Path "$env:programfiles (x86)/Microsoft VS Code*/code*.exe";
if ($code -eq $true) {
  $path = Resolve-Path "$env:programfiles (x86)/Microsoft VS Code*/code*.exe";
  Start-Process $path -ArgumentList $args;
} else {
  notepad $args;
}
