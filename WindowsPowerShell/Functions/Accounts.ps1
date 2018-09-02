function global:Accounts([parameter(position = 0)]$keyword) {
  if ($SyncRoot) {
    $accounts = Resolve-Path "$SyncRoot/Essentials/accounts.ini"
    if ($null -eq $keyword) {
      notepad $accounts;
    } else {
      if (Get-Command -ErrorAction SilentlyContinue gawk) {
        Get-Content $accounts | gawk "tolower(`$0) ~ /$keyword[^{]*$/"
        Get-Content $accounts | gawk "tolower(`$0) ~ /$keyword.*\{$/,/^\}$/"
      } else {
        Get-Content $accounts | Select-String "$keyword"
      }
    }
  } else {
    Write-Error "SyncRoot has not been set."
  }
}
