param([switch] $v, [string] $program);

$path = "~/programs/$program*/bin";
if ($v -eq $True) {
  return Verify-Path -v $path;
} else {
  return Verify-Path $path;
}
