param([switch] $verbose, [switch] $update)

$oldverbose = $VerbosePreference
if ($verbose) {
  $VerbosePreference = "continue"
}

if (Verify-Bin "midway" -eq $True) {
  if ($update -eq $True) {
    $bin = Resolve-Path "~/Programs/midway/bin";
    Write-Verbose "Download latest mwinit to $bin";
    Invoke-WebRequest https://s3.amazonaws.com/com.amazon.aws.midway.software/windows/mwinit.exe -o "$bin/mwinit.exe"
  }
  Clear-Host;
  $key = Resolve-Path "~/.ssh/primary.pem.pub";
  Write-Verbose "Init Midway for $key";
  mwinit -k "$key" -o;
  Clear-Host;
  ssh um-cli mwinit -o --no-update-check -k ~/.ssh/primary.pem.pub;
  Clear-Host;
  ssh um-cli kinit -f;
  Clear-Host;
}

$VerbosePreference = $oldverbose
