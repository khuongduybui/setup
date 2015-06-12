param($module, $alias, $main)

if (Test-Path "$(Split-Path $profile)\Modules\$module\$module.psm1") {
	if ($alias -eq $null) {
		Write-Host "$module loaded." -ForegroundColor DarkGreen;
	} else {
		Write-Host "$module loaded as '$alias'." -ForegroundColor DarkGreen;
	}
} else {
	Write-Host "$module missing! Attempting to install..." -ForegroundColor DarkYellow;
	if ($module -eq "PsGet") {
		(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex;
	} else {
		PsGet\Install-Module $module;
	}
}

if ($alias -ne $null) {
	if ($main -eq $null) {
		$main = $module;
	}
	Set-Alias -scope global $alias $main;
}

if (Test-Path "$(Split-Path $profile)\Modules\$module\profile.example.ps1") { 
	. (Resolve-Path "$(Split-Path $profile)\Modules\$module\profile.example.ps1");
}
