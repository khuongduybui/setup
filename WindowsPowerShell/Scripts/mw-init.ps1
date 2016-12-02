param([switch] $verbose)

$oldverbose = $VerbosePreference
if ($verbose) {
  $VerbosePreference = "continue"
}

if (Verify-Bin "midway" -eq $True) {
  $key = Resolve-Path "~/.ssh/primary.pem.pub";
  Write-Verbose "Init Midway for $key";
  mwinit -k "$key";
  scp ~/.ssh/*-cert.pub um-cli:~/.ssh;
  scp -r ~/.midway um-cli:~;
  ssh um-cli 'chmod 600 ~/.ssh/*-cert.pub';
}

$VerbosePreference = $oldverbose
