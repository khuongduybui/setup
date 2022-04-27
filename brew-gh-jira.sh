#! /bin/sh

if which pass >/dev/null 2>&1; then
    brew tap StevenACoffman/jt
    brew install jt
    gh extensions install StevenACoffman/gh-jira

    pass MSI/JIRA >~/.config/jira
else
    echo "pass is missing"
fi
