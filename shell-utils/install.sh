#! /usr/bin/env sh

cd ~/setup/shell-utils || exit
for script in scripts/*.ts; do
    deno install -f --no-check -A --unstable --reload "$(pwd)/${script}"
done
which deno | grep -q asdf && asdf reshim || true
