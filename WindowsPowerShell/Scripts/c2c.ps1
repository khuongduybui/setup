param([switch] $o, [string] $Project);

if ($Project -eq $null) {
	Get-ChildItem ~\code\;
} else {
	if (Test-Path ~\code\$Project) {
		cd ~\code\$Project;

		if (Test-Path .\src\*) {
			cd .\src\*;
		}

		if (Test-Path .\.git) {
			g;
		} else {
			l;
		}

		if (Test-Path .\venv\Scripts\active) {
			& .\venv\Scripts\active;
		}

		if ($o -eq $true) {
			$solution = $false;

			$files = Get-ChildItem -force | Where-Object {$_.NAME -match "\.sln$"};
			foreach ($file in $files) {
				$f = $file.Name;
				& ".\$f";
				$solution = $true;
			}

			if ($solution -eq $false) {
				e .
			}
		}
	} else {
		Write-Host "$Project not found." -ForegroundColor DarkRed;
		popd;
	}
}
