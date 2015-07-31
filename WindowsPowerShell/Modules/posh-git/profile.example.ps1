Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module .\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
	$realLASTEXITCODE = $LASTEXITCODE
	Write-Host($(whoami).replace($(hostname) + "\", "").replace("\", "/")) -NoNewLine -ForegroundColor Blue
	Write-Host "@" -NoNewLine
	Write-Host($(hostname) + " ") -NoNewLine -ForegroundColor DarkMagenta

	Write-Host($pwd.ProviderPath.Replace($env:HOME, "~").Replace("\", "/")) -NoNewLine -ForegroundColor Red

	Write-VcsStatus

	$brazil = Verify-Command brazil;
	If ($brazil -eq $True) {
		Write-Host " aps" -NoNewLine;
	}

	$global:LASTEXITCODE = $realLASTEXITCODE
	return "> "
}

Pop-Location

Start-SshAgent -Quiet
