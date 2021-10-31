#! /bin/sh

brew tap StevenACoffman/jt
brew install jt
gh extensions install StevenACoffman/gh-jira

pass MSI/JIRA >~/.config/jira
