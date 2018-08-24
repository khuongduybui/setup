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
      $Function = $FunctionFile -replace "\.ps1", ""
      $Functions += $Function
      Import-Module -Force -Global "$FunctionPath\$FunctionFile"
    }
  }
}
