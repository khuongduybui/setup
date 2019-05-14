function ssm-env
aws autoscaling describe-auto-scaling-instances | jq '.AutoScalingInstances | map(select(.AutoScalingGroupName == "'$argv[1]'")) | .[].InstanceId'
end
