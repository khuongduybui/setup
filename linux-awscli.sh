#! /bin/bash

if which pip; then
    pip install --user awscli
    if host git.amazon.com >/dev/null; then
        pip install --user git+ssh://git.amazon.com/pkg/BenderLibIsengard
        pip install --user git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
    fi
else
    echo "pip not found"
fi
