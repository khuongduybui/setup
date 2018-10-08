function global:Sudo() {
  If ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent().IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Information "Already running as Administrator."
  } else {
    Write-Information "Attempting to restart command as Administrator."
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
  }
}
