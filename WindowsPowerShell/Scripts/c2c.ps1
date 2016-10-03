param([switch] $o, [string] $Project, [string] $Component);

if ($Project -eq '') {
  Get-ChildItem ~\code\
} else {
  if (Test-Path ~\code\$Project) {
    Set-Location ~\code\$Project;

    if (Test-Path .\src\*$Component*) {
      Set-Location .\src\*$Component*;
    }

    if (($Component -ne '') -and (Test-Path .\*$Component*)) {
      Set-Location .\*$Component*
    }

    if (Test-Path .\.git) {
      git status;
    } else {
      Get-ChildItem;
    }

    if (Test-Path .\venv\Scripts\active) {
      & .\venv\Scripts\active;
    }

    if ($o -eq $true) {
      $solution = $false;

      $files = Get-ChildItem -force | Where-Object {$_.NAME -match "\.sln$"};
      foreach ($file in $files) {
        $f = $file.Name;
        & ".\$f";
        $solution = $true;
      }

      if ($solution -eq $false) {
        e .
      }
    }
  } else {
    Write-Host "$Project not found." -ForegroundColor Red;
    popd;
  }
}
