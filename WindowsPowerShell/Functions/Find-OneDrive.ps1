function global:Find-OneDrive {
  # Windows 10 registry
  $OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\Windows\CurrentVersion\SkyDrive\" -Name UserFolder -ErrorAction Silent).UserFolder
  # Older Windows registry
  if ($Null -eq $OneDrive -Or (Test-Path $OneDrive) -eq $False) {
    $OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\OneDrive\" -Name UserFolder -ErrorAction Silent).UserFolder
  }
  # Fallback to default location
  if ($Null -eq $OneDrive -Or (Test-Path $OneDrive) -eq $False) {
    $OneDrive = Resolve-Path -ErrorAction Silent "~/OneDrive"
  }
  # Check commonly used custom location
  if ($Null -eq $OneDrive -Or (Test-Path $OneDrive) -eq $False) {
    $OneDrive = Resolve-Path -ErrorAction Silent "D:/OneDrive"
  }
  # Give up
  return $OneDrive
}
