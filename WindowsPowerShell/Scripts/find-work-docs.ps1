if ((Test-Path "~/WorkDocs") -eq $True) {
  $root = Resolve-Path "~/WorkDocs";
  Write-Output $root;
} else {
  if ((Test-Path "$($SpecialFolders['LocalApplicationData'])/Amazon WorkDocs/SyncClient") -eq $True) {
    $WorkDocsInstallation = Resolve-Path "$($SpecialFolders['LocalApplicationData'])/Amazon WorkDocs/SyncClient";
    if ((Test-Path "$WorkDocsInstallation/service.log") -eq $True) {
      $lastRootLogEntry = (Select-String -Path "$($SpecialFolders['LocalApplicationData'])/Amazon WorkDocs/SyncClient/*.log*" -Pattern "sync root: ");
      if ($null -ne $lastRootLogEntry) {
        $root = ($lastRootLogEntry[-1] -Split "sync root: ")[-1];
        Write-Output $root;
      } else {
        Write-Error "sync root not found.";
      }
    } else {
      Write-Error "service.log not found.";
    }
  } else {
    Write-Error "WorkDocs not found.";
  }
}
