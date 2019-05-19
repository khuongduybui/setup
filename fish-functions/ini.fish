# Defined in /tmp/fish.7GHy5K/ini.fish @ line 3
function ini
  if test (count $argv) = 2
    sed -nr "/^\[$argv[1]\]/ { :l /^$argv[2][ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}"
  else
    echo "Usage: ini <section> <key>"
  end
end
