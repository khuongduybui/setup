function ssm-mysql
    set -l info (ssm-get $argv[1])
    set -l engine (echo $info | jq -r '.engine')
    set -l host (echo $info | jq '.host')
    set -l cluster (aws rds describe-db-instances | jq '.DBInstances[] | select(.Endpoint.Address == '$host') | .DBClusterIdentifier')
    set -l endpoint (aws rds describe-db-cluster-endpoints | jq '.DBClusterEndpoints[] | select(.DBClusterIdentifier == '$cluster') | select(.EndpointType == "WRITER") | select(.Status == "available") | .Endpoint')
    set -l port (echo $info | jq '.port')
    set -l username (echo $info | jq '.username')
    set -l password (echo $info | jq '.password' | sed 's/\$/\\\$/g')
    set -l database (echo $info | jq '.dbname')
    echo '$ PASSWORD=(aws secretsmanager get-secret-value --secret-id '$argv[1]' | jq .SecretString | jq fromjson | jq .password)'
    echo '$ '$engine --host=$endpoint --port=$port --user=$username --password='$PASSWORD' $database
    eval $engine --host=$endpoint --port=$port --user=$username --password=$password $database
end
