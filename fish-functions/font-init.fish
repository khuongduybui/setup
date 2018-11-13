# Defined in /tmp/fish.hPitFj/font-init.fish @ line 2
function font-init
    set_color $fish_color_operator; echo Checking Windows fonts into WSL; set_color normal
    sudo mkdir -p /etc/fonts
    if test -f /etc/fonts/local.conf
        echo -n User fonts...
        if grep -q /etc/fonts/local.conf -e 'AppData/Local/Microsoft/Windows/Fonts'
            echo Done
        else
            echo -n Adding...
            sudo sed -i "s/<fontconfig>/<fontconfig>\n<dir>$W/AppData/Local/Microsoft/Windows/Fonts</dir>" /etc/wsl.conf
            echo Done
        end
        echo -n System fonts...
        if grep -q /etc/fonts/local.conf -e "$WROOT/c/Windows/Fonts"
            echo Done
        else
            echo -n Adding...
            sudo sed -i "s/<fontconfig>/<fontconfig>\n<dir>$WROOT/c/Windows/Fonts</dir>" /etc/wsl.conf
            echo Done
        end
    else
        echo '<?xml version="1.0"?>' | sudo tee /etc/fonts/local.conf
        echo '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">' | sudo tee -a /etc/fonts/local.conf
        echo '<fontconfig>' | sudo tee -a /etc/fonts/local.conf
        echo "<dir>$WROOT/c/Windows/Fonts</dir>" | sudo tee -a /etc/fonts/local.conf
        echo "<dir>$W/AppData/Local/Microsoft/Windows/Fonts</dir>" | sudo tee -a /etc/fonts/local.conf
        echo '</fontconfig>' | sudo tee -a /etc/fonts/local.conf
        echo Done
    end
end
