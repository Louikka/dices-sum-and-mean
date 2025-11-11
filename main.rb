# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

require 'optparse'

require './lib/utils'


__CELL_WIDTH = 8


# program options
OPTIONS = {
    no_of_rolls: 3,
    no_of_dices_per_roll: 5,
    no_of_sides_per_dice: 6,
}

OptionParser.new do |opts|
    __desc = "How many times to roll (default: #{ OPTIONS[:no_of_rolls] })."
    opts.on("-r NUMBER", "--rolls NUMBER", __desc) do |v|
        OPTIONS[:no_of_rolls] = v.to_i()
    end

    __desc = "How many dices per roll (default: #{ OPTIONS[:no_of_dices_per_roll] })."
    opts.on("-d NUMBER", "--dices NUMBER", __desc) do |v|
        OPTIONS[:no_of_dices_per_roll] = v.to_i()
    end

    __desc = "Sides per dice (default: #{ OPTIONS[:no_of_sides_per_dice] })."
    opts.on("-s NUMBER", "--sides NUMBER", __desc) do |v|
        if v.to_i() <= 0
            raise RangeError
        end
        OPTIONS[:no_of_sides_per_dice] = v.to_i()
    end
end.parse!()



total_sum = []
total_mean = []


for i in 1..OPTIONS[:no_of_dices_per_roll] do
    print "\e[1m#{ "[#{i}]".rjust(__CELL_WIDTH) }\e[22m" # bold
end

print "    "
print "\e[1m#{ "SUM".rjust(__CELL_WIDTH) }\e[22m"
print "\e[1m#{ "MEAN".rjust(__CELL_WIDTH) }\e[22m\n"


OPTIONS[:no_of_rolls].times do
    dices_values = []

    OPTIONS[:no_of_dices_per_roll].times do
        dice_rand_n = rand(1..OPTIONS[:no_of_sides_per_dice])
        dices_values.push(dice_rand_n)
        dice_rand_n_s = dice_rand_n.to_s().rjust(__CELL_WIDTH)
        print dice_rand_n_s
    end

    print "    "

    sum = dices_values.sum()
    sum_s = sum.to_s().rjust(__CELL_WIDTH)
    print "\e[32m#{ sum_s }\e[0m" # green

    mean = calculate_mean(dices_values)
    mean_s = mean.to_s().rjust(__CELL_WIDTH)
    print "\e[34m#{ mean_s }\e[0m\n" # blue

    total_sum.push(sum)
    total_mean.push(mean)
end


print "Average SUM: \e[32m#{ calculate_mean(total_sum, 0) }\e[0m\n"
print "Average MEAN: \e[34m#{ calculate_mean(total_mean) }\e[0m\n"
