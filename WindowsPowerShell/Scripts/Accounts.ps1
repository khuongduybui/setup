param($keyword);

pushd;
cd ~\OneDrive;

if ($keyword -eq $null) {
    e .\Essentials\accounts.ini;
} else {
    cat .\Essentials\accounts.ini | gawk "/$keyword/";
    cat .\Essentials\accounts.ini | gawk "/$keyword.*\{/,/\}/";
}

popd;
