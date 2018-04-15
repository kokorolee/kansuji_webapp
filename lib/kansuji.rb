require 'pry'
class Integer
  NUMS_HASH = {1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九", 10 => "十", 100 => "百", 10 ** 3 => "千", 10 ** 4 => "万"}
  UNIT_HASH = {2 => '万', 3 => "億", 4 => "兆" , 5 => "京", 6 => "垓", 7 => "禾予", 8 => "穣", 9 => "溝", 10 => "澗", 11 => "正", 12 => "載", 13 => "極", 14 => "恒河沙", 15 => "阿僧祇"}

  def unit_hash(number)
    return NUMS_HASH[10]if number >= 10 && number < 100
    return NUMS_HASH[100] if number >= 100 && number < 1000
    return NUMS_HASH[1000] if number >= 1000 && number < 10000
    return NUMS_HASH[10000] if number >= 10000 && number < 100000000
  end

  def group_f
    result = []
    inputs = self
    arr_input = self.to_s.split('')
    arr_input.each_with_index do |val, index|
      next if val.to_i == 0
      result << NUMS_HASH[val.to_i] if val.to_i != 1
      result << unit_hash(inputs) if val.to_i != 1
      result << unit_hash(inputs) if val.to_i == 1
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
  puts arr_size

  reverse_array.each do | arrays |

    print "\narray: "
    print arrays.reverse.join()
    number = arrays.reverse.join().to_i
    print "\nnumber: "
    print number
    print "\n"
    rs << number.group_f
    rs << UNIT_HASH[arr_size] unless number == 0
    arr_size -= 1
  end
  puts rs.join
end
  # # #
end

puts 'Enter number to kanji'
input = gets.chomp
puts input.to_s.to_i.to_kansuji
