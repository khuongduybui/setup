If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
	$arguments = "& '" + $myinvocation.mycommand.definition + "'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}

 cmd /c "C:\Windows\System32\cscript.exe" "C:\Program Files (x86)\Microsoft Office\Office15\OSPP.VBS" "/sethst:OSD-STORE-02.ant.amazon.com"