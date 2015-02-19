param([string] $Project);

if ($Project -eq $null) {
  l ~\Code\;
} else {
  if (Test-Path ~\Code\$Project) {
    cd ~\Code\$Project;

    if (Test-Path .\.git) {
      g;
    } else {
      l;
    }
  } else {
    Write-Host "$Project not found." -ForegroundColor DarkRed;
    popd;
  }
}
