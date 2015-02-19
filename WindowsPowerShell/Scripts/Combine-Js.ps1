param($path);

pushd;

if (Test-Path $path) {
    cd $path;
}

cd .\public\js;
if (Test-Path ".\combined.js") {
    rm combined.js;
}
java -jar C:\Users\Duy\OneDrive\Programs\compiler.jar --js *.js .\controllers\*.js --js_output_file combined.js --angular_pass

popd;
