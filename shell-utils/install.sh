#! /usr/bin/env sh

cd ~/setup/shell-utils || exit
for script in scripts/*.ts; do
    deno install -f --no-check -A --unstable "$(pwd)/$script"
done
