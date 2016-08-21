$OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\Windows\CurrentVersion\SkyDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
if ($null -eq $OneDrive) {
  $OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\OneDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
}
if ($null -eq $OneDrive) {
  $OneDrive = Resolve-Path -ErrorAction Silent "~/OneDrive";
}
if ($null -eq $OneDrive) {
  Write-Error "OneDrive not found.";
} else {
  Write-Output $OneDrive;
}
