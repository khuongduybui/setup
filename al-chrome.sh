#!/bin/bash

curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -o /tmp/google-chrome.rpm
sudo yum install /tmp/google-chrome.rpm
rm -f /tmp/google-chrome.rpm
