Start-SSHAgent;
Get-ChildItem ~/.ssh/*.pem | ForEach-Object { ssh-add $_ };
