param([switch] $verbose, [switch] $update)

$oldverbose = $VerbosePreference
if ($verbose) {
  $VerbosePreference = "continue"
}

if (Verify-Bin "midway" -eq $True) {
  if ($update -eq $True) {
    $bin = Resolve-Path "~/Programs/midway/bin";
    Write-Verbose "Download latest mwinit to $bin";
    curl https://s3.amazonaws.com/com.amazon.aws.midway.software/windows/mwinit.exe -o "$bin/mwinit.exe"
  }
  $key = Resolve-Path "~/.ssh/primary.pem.pub";
  Write-Verbose "Init Midway for $key";
  mwinit -k "$key" -o;
  scp ~/.ssh/*-cert.pub um-cli:~/.ssh;
  scp -r ~/.midway um-cli:~;
  ssh um-cli 'chmod 600 ~/.ssh/*-cert.pub';
}

$VerbosePreference = $oldverbose
