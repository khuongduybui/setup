param([switch] $v, [string] $program);

$path = "~/programs/$program*/bin";
if ($v -eq $True) {
  return verify-path -v $path;
} else {
  return verify-path $path;
}
