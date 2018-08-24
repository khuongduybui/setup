Set-PSRepository -Name PSGallery -InstallationPolicy Trusted > $null;
Set-PackageSource -Name chocolatey -Trusted > $null;

Write-Host "Verifying PowerShellGet modules..." -ForegroundColor Yellow;
Verify-PS-Module "Pscx";
Verify-PS-Module "ShowUI";
Verify-PS-Module "PsReadline";
# if you don't already have this configured...
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Write-Host "Verifying PsGet modules..." -ForegroundColor Yellow;
$global:PsGetDestinationModulePath = "$(Split-Path $Profile)\Modules";
Verify-Module "PsGet";
Verify-Module "Find-String" "awk";