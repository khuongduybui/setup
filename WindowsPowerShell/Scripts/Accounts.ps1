param($keyword);

pushd;
cd $SyncRoot;

if ($keyword -eq $null) {
    e $(Resolve-Path ".\Essentials\accounts.ini");
} else {
    cat .\Essentials\accounts.ini | gawk "/$keyword/";
    cat .\Essentials\accounts.ini | gawk "/$keyword.*\{/,/\}/";
}

popd;
