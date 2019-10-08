#! /bin/bash

if which rustup >/dev/null 2>&1; then
  rustup update
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
