$env:NODIST_PREFIX = Resolve-Path("~/Programs/nodist");

if (Verify-Command "nodist") {
  [Environment]::SetEnvironmentVariable("NODIST_PREFIX", $env:NODIST_PREFIX, "User")
  Write-Output "nodist $(nodist --version)";
  Write-Output "node $(node --version)";
  Write-Output "npm $(npm --version)";
} else {
  if ($(Verify-Bin "nodist") -eq $False) {
    Write-Error "nodist missing. Try https://github.com/marcelklehr/nodist/releases/latest";
  } else {
    Node-Init;
  }
}
