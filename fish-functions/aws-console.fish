# Defined in /tmp/fish.Vv0wzg/aws-console.fish @ line 2
function aws-console
    echo "Verifying AWS_PROFILE..."
    set -l profile $AWS_PROFILE
    if test (count $argv) -gt 0
        set -x profile (cat ~/.aws/config | grep --color=never '\[profile' | sed -e 's/\[profile //' -e 's/\]//' | fzf -1 -q $argv[1])
    end
    test -z $profile
    and set profile default

    echo "Verifying utilities..."
    if not type -q urlencode
        yarn global add url-cli
        asdf reshim
    end
    if not type -q uuid
        yarn global add uuid
        asdf reshim
    end

    echo "Verifying permission..."
    set -l stsRole (aws --profile $profile sts get-federation-token --name (whoami) --policy '{"Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}')
    if test -n "$stsRole"
        # echo $stsRole | jq

        echo "Assuming role..."
        set -l sessionId (echo $stsRole | jq -r .Credentials.AccessKeyId)
        set -l sessionKey (echo $stsRole | jq -r .Credentials.SecretAccessKey)
        set -l sessionToken (echo $stsRole | jq -r .Credentials.SessionToken)
        # echo "{\"sessionId\":\"$sessionId\",\"sessionKey\":\"$sessionKey\",\"sessionToken\":\"$sessionToken\"}"

        set -l signinSession (urlencode -p "{\"sessionId\":\"$sessionId\",\"sessionKey\":\"$sessionKey\",\"sessionToken\":\"$sessionToken\"}")
        # echo "https://signin.aws.amazon.com/federation?Action=getSigninToken&Session=$signinSession"

        echo "Generating console signin token..."
        set -l bar (curl -s "https://signin.aws.amazon.com/federation?Action=getSigninToken&Session=$signinSession")
        # echo $bar | jq

        set -l signinToken (echo $bar | jq -r .SigninToken)
        set -l signinUrl "https://signin.aws.amazon.com/federation?Action=login&Destination=https%3A%2F%2Fconsole.aws.amazon.com&SigninToken=$signinToken"
        # echo "$signinUrl"

        echo "Generating shortened URL..."
        set -l short (urlencode -p "$signinUrl")
        set -l name aws-(whoami)-$profile-(uuid)
        set -l cuttlyUrl "https://cutt.ly/api/api.php?key=a2967c0ad7db4197d8244182b087888e05a64&name=$name&short=$short"
        # echo 'curl -s "'$cuttlyUrl'"'

        set -l cuttly (curl -s "$cuttlyUrl")
        # echo $cuttly | jq

        set -l url (echo "$cuttly" | jq -r '.url.shortLink' | grep -v null)

        if test -z "$url"
            echo "URL shortening failed, using full URL..."
        end

        echo $url
        if __is_win
            explorer.exe "$url"
        else
            microsoft-edge "$url"
        end
    end
end
