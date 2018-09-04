function global:Mw-Init([String] $k, [switch] $o) {
  if (Get-Command -ErrorAction SilentlyContinue mwinit) {
    if ($key -And !(Test-Path $key)) {
      Write-Warning "Provided key ($key) not found. Attempting to search default locations."
    }
    if (!$key) {
      $key = "/invalid/path"
    }
    if (!(Test-Path $key)) {
      $key = "~/.ssh/primary.pem.pub"
    }
    if (!(Test-Path $key)) {
      $key = "~/.ssh/id_rsa.pub"
    }
    if (!(Test-Path $key)) {
      Write-Error "Public key not found."
    } else {
      $oParam = if ($o) { "-o" }
      mwinit -k (Resolve-Path $key) $oParam
    }
  } else {
    Write-Error "mwinit not found in `$env:PATH."
  }
}
