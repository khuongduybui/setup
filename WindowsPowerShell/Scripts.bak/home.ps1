Enter-PSSession -ComputerName h8-1241 -credential (new-object -typename System.Management.Automation.PSCredential -argumentlist "duy@buifamily.info", (ConvertTo-SecureString "M1crosoft=" -AsPlainText -Force)) -EnableNetworkAccess