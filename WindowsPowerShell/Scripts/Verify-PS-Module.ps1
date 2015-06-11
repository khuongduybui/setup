param($module, $alias, $main)

$check = Get-InstalledModule -name $module -ErrorAction SilentlyContinue;
if ($check -eq $null) {
	Write-Host "$module missing! Attempting to install... " -ForegroundColor DarkYellow -NoNewLine;
	Import-Module PowerShellGet;
	Install-Module $module;
	Verify-PS-Module $module $alias $name;
} else {
	Write-Host "$module loaded." -ForegroundColor DarkGreen;
}
