function global:Choco-Init([switch] $f) {
  if (Get-Command -ErrorAction SilentlyContinue "choco") {
    Write-Output "choco installed."
  } else {
    if ($f) {
      Write-Warning "choco missing! Fetching..."
      Invoke-Expression (New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1")
      return Choco-Init
    } else {
      Write-Error "choco missing! Run Choco-Init -f to install."
    }
  }
}
