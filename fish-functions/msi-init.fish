# Defined in /tmp/fish.iiHIU9/msi-init.fish @ line 2
function msi-init
    aws-sso-util login --all

    x-www-browser https://gateway1.hawk.activeeye.com/gateway
    x-www-browser https://gateway1.wasp.activeeye.com/gateway
    x-www-browser https://gateway1.lion.activeeye.com/gateway
    x-www-browser https://gateway1.orca.activeeye.com/gateway

    sft list-servers
end
