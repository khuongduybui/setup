function global:Reload {
  if (Test-Path $FunctionPath) {
    Write-Verbose "Removing custom functions."
    foreach ($Function in $Functions) {
      Remove-Module $Function
      Remove-Item "Function:/$Function"
    }
    $Functions = @()

    Write-Verbose "Importing functions from $FunctionPath."
    foreach ($FunctionFile in $(Get-ChildItem $FunctionPath)) {
      $FunctionName = $($FunctionFile -replace "\.ps1", "").Replace($FunctionPath + "\", "")
      $Functions += $FunctionName
      Import-Module "$FunctionPath\$FunctionName.ps1" -Force
    }

    $EI = Get-ChildItem "Function:/Environment-Init" -ErrorAction SilentlyContinue
    if ($null -ne $EI) {
      Environment-Init
    }
  }
}
