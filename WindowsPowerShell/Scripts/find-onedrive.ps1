$OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\Windows\CurrentVersion\SkyDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
if ($Null -eq $OneDrive -Or (Test-Path $OneDrive) -eq $False) {
  $OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\OneDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
}
if ($Null -eq $OneDrive -Or (Test-Path $OneDrive) -eq $False) {
  $OneDrive = Resolve-Path -ErrorAction Silent "~/OneDrive";
}
if ($Null -eq $OneDrive) {
  Write-Error "OneDrive not found.";
} else {
  Write-Output $OneDrive;
}
