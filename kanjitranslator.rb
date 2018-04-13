require 'awesome_print'
NUMS_HASH = {
  1 => "一",
  2 => "二",
  3 => "三",
  4 => "四",
  5 => "五",
  6 => "六",
  7 => "七",
  8 => "八",
  9 => "九",
}
UNIT_HASH = {
  10 => "十",
  100 => "百",
  1000 => "千",
  10000 => "万",
  100000000 => "億",
  1000000000000 => "兆"
}

def unit_hash(number)
  if number >= 10 && number < 100
    return UNIT_HASH[10]
  else
    if number >= 100 && number < 1000
      return UNIT_HASH[100]
    end
    if number >= 1000 && number < 10000
      return UNIT_HASH[1000]
    end
    if number >= 10000 && number < 100000000
      return UNIT_HASH[10000]
    end
    if number >= 100000000 && number < 1000000000000
      return UNIT_HASH[100000000]
    end
    if number >= 1000000000000 && number < 1000000000000000
      return UNIT_HASH[1000000000000]
    end
  end
end
inputs = 123451234512345
arr_input = inputs.to_s.split('')



puts arr_input.each_slice(5).each do | batch |
  batch.each do | value |
    puts value
  end
end
#
# result = []
# arr_input.each do |input|
#   result <<  NUMS_HASH[input.to_i]
#   result << unit_hash(inputs)
#   inputs = inputs/10
# end
# puts result.to_s
# puts "\n"
