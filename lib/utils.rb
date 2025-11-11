# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

def calculate_mean(arr, precision = 2)
    if arr.empty?
        return 0.0
    else
        return (arr.sum(0.0) / arr.length).round(precision)
    end
end
