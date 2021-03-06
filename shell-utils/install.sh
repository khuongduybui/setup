#! /usr/bin/env sh

cd ~/setup/shell-utils
for script in $(ls scripts)
do
    deno install -f --no-check -A --unstable $(pwd)/scripts/$script
done
