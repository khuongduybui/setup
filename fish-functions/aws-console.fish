# Defined in /tmp/fish.xZ4uiw/aws-console.fish @ line 2
function aws-console
    set -l profile $AWS_PROFILE
    if test (count $argv) -gt 0
        set -x profile (cat ~/.aws/config | grep --color=never 'profile' | sed -e 's/\[profile //' -e 's/\]//' | fzf -1 -q $argv[1])
    end
    test -z $profile
    and set profile default

    type -q urlencode
    or yarn global add url-cli
    and asdf reshim

    type -q uuid
    or yarn global add uuid
    and asdf reshim

    set -l foo (aws --profile $profile sts get-federation-token --name (whoami) --policy '{"Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}')
    if test -n "$foo"
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
        if not __is_wsl
            microsoft-edge "$signinUrl"
        end
        # set -l short (urlencode -p "$signinUrl")
        # set -l name "aws-(whoami)-$profile-(uuid)"
        # echo "$short"
        # set -l cuttly (curl -s "https://cutt.ly/api/api.php?key=a2967c0ad7db4197d8244182b087888e05a64&name=$name&short=$short")
        # echo $cuttly | jq
        # set -l url (echo "$cuttly" | jq -r '.url.shortLink' | grep -v null)
        # if test -n "$url"
        #     echo "$url"
        #     explorer.exe "$url"
        # else
        #     echo "$signinUrl"
        #     explorer.exe "$signinUrl"
        # end
    end
end
