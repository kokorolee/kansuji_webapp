require 'pry'
class Integer
  NUMS_HASH = {1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九", 10 => "十", 100 => "百", 10 ** 3 => "千", 10 ** 4 => "万", 10 ** 8 => "億", 1000000000000 => "兆"}

  def unit_hash(number)
    return NUMS_HASH[10]if number >= 10 && number < 100
    return NUMS_HASH[100] if number >= 100 && number < 1000
    return NUMS_HASH[1000] if number >= 1000 && number < 10000
    return NUMS_HASH[10000] if number >= 10000 && number < 100000000
    return NUMS_HASH[100000000] if number >= 100000000 && number < 1000000000000
    return NUMS_HASH[1000000000000] if number >= 1000000000000 && number < 1000000000000000
  end

  def group_f
    result = []
    inputs = self
    arr_input = self.to_s.split('')
    arr_input.each_with_index do |val, index|
      next if val.to_i == 0
      result << NUMS_HASH[val.to_i] if val.to_i!= 1
      result << unit_hash(inputs) if val.to_i!= 1
      result << unit_hash(inputs) if val.to_i== 1
      result << NUMS_HASH[val.to_i] if  val.to_i == 1 && index == arr_input.size - 1
      inputs = inputs/10
      # binding.pry
    end
    string = result.join("")
    return string
  end

def to_kansuji
  new_input_array = self.to_s.reverse.split('').each_slice(4)

  rs = []
  reverse_array = new_input_array.reverse_each
  arr_size = reverse_array.size
  reverse_array.each do | arrays |

    print "\narray: "
    print arrays.reverse.join()
    number = arrays.reverse.join().to_i
    print "\nnumber: "
    print number
    rs << number.group_f
    # print "array size" + arr_size.to_s + "\n"
    case arr_size
    when 2
      rs << "万" unless arrays == 0
    when 3
      rs << "億" unless arrays == 0
    when 4
      rs << "兆" unless arrays == 0
    end
    arr_size -= 1
  end
  puts rs.join
end
  # # #
end

input = gets.chomp
puts 'Enter number to kanji'
puts input.to_s.to_i.to_kansuji
