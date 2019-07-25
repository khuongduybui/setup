# Defined in /tmp/fish.h3rf9C/ssm-env.fish @ line 2
function ssm-env
    aws autoscaling describe-auto-scaling-instances | jq -r '.AutoScalingInstances | map(select(.AutoScalingGroupName == "'$argv[1]'")) | .[].InstanceId'
end
