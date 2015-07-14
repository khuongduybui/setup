param([switch] $o, [string] $Project);

if ($Project -eq $null) {
	l ~\Code\;
} else {
	if (Test-Path ~\Code\$Project) {
		cd ~\Code\$Project;

		if (Test-Path .\.git) {
			g;
		} else {
			l;
		}

		if (Test-Path .\venv\Scripts\active) {
			& .\venv\Scripts\active;
		}

		if ($o -eq $true) {
			code .
		}
	} else {
		Write-Host "$Project not found." -ForegroundColor DarkRed;
		popd;
	}
}
