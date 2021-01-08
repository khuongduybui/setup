function segment -a fg bg text -d "Add prompt segment"
    if test -z "$segment_color"
        set segment_color normal
    end

    set -g segment (set_color $fg -b $bg)"$text"(set_color $bg -b $segment_color)"$segment"
    set -g segment_color $bg
end

function segment_right -a fg bg text -d "Add right prompt segment"
    set -l right_color $segment_right_color

    if test -z "$right_color"
        set right_color $bg
    end

    set -g segment_right_color $fg

    echo (set_color $bg)(set_color $segment_right_color -b $bg)"$text"(set_color $right_color)
end

function segment_close
    if test ! -z "$segment"
        printf "$segment "
        set segment
        set segment_color
    end
    set_color normal
end
