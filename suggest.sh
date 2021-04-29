#! /bin/bash

if which $1 2>/dev/null >/dev/null; then
  echo ✅ $1: $(which $1)
else
  echo ❎ $1: $2
fi
