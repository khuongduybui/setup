function aws-console
    set -l profile $AWS_PROFILE
    if test (count $argv) -gt 0
        set -x profile $argv[1]
    end
    echo Federating as (whoami)"@$profile" with the following URL:
    test -n $profile
    and set profile default

    which urlencode >/dev/null 2>&1
    or yarn global add url-cli

    set -l foo (aws --profile $profile sts get-federation-token --name (whoami) --policy '{"Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}')
    # echo $foo | jq

    set -l sessionId (echo $foo | jq -r .Credentials.AccessKeyId)
    set -l sessionKey (echo $foo | jq -r .Credentials.SecretAccessKey)
    set -l sessionToken (echo $foo | jq -r .Credentials.SessionToken)
    # echo "{\"sessionId\":\"$sessionId\",\"sessionKey\":\"$sessionKey\",\"sessionToken\":\"$sessionToken\"}"

    set -l signinSession (urlencode -p "{\"sessionId\":\"$sessionId\",\"sessionKey\":\"$sessionKey\",\"sessionToken\":\"$sessionToken\"}")
    # echo "https://signin.aws.amazon.com/federation?Action=getSigninToken&Session=$signinSession"

    set -l bar (curl -s "https://signin.aws.amazon.com/federation?Action=getSigninToken&Session=$signinSession")
    # echo $bar | jq

    set -l signinToken (echo $bar | jq -r .SigninToken)
    set -l signinUrl "https://signin.aws.amazon.com/federation?Action=login&Destination=https%3A%2F%2Fconsole.aws.amazon.com&SigninToken=$signinToken"
    echo "$signinUrl"
end
