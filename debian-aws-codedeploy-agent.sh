#! /bin/bash

# From https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html
sudo apt install -y wget ruby
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install -O /tmp/aws-codedeploy-install
chmod +x /tmp/aws-codedeploy-install
sudo /tmp/aws-codedeploy-install auto
sudo service codedeploy-agent start
sudo systemctl enable codedeploy-agent
