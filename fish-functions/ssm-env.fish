# Defined in /tmp/fish.qTKLmf/ssm-env.fish @ line 2
function ssm-env
	set -l asg
    if test (count $argv) = 1
        set -x asg $argv[1]
    else
        set -l asgs (aws autoscaling describe-auto-scaling-instances | jq -r '.AutoScalingInstances[].AutoScalingGroupName' | uniq)
        set -l menu_cursor_glyph \uf7c2
        menu $asgs
        set -x asg $asgs[$menu_selected_index]
    end
    echo 'ASG:      '\uf7c2 $asg

    set -l instanceId
    set -l instances (aws autoscaling describe-auto-scaling-instances | jq -r '.AutoScalingInstances | map(select(.AutoScalingGroupName == "'$asg'")) | .[].InstanceId')
    set -l menu_cursor_glyph \uf878
    menu $instances
    set -l instanceId $instances[$menu_selected_index]
    echo 'Instance: '\uf878 $instanceId

    aws ssm start-session --target $instanceId
end
