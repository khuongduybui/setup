function fish_greeting -d What\'s\ up,\ fish\?
  if which brazil >/dev/null 2>&1
  else if which wslfetch >/dev/null 2>&1
    wslfetch
  else
    set_color $fish_color_autosuggestion
    uname -nmsr
    uptime
    set_color normal
  end
  test -f ~/setup/banner.md; and cat ~/setup/banner.md
end
