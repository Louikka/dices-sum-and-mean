# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

def set_color_format(fmt)
    case fmt
    when "black"
        print "\e[30m"
    when "red"
        print "\e[31m"
    when "green"
        print "\e[32m"
    when "brown"
        print "\e[33m"
    when "blue"
        print "\e[34m"
    when "magenta"
        print "\e[35m"
    when "cyan"
        print "\e[36m"
    when "gray"
        print "\e[37m"
    else
        print "\e[0m"
    end
end

def clear_color_format()
    print "\e[0m"
end
