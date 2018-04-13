require 'pry'
class Integer
  NUMS_HASH = {1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九", 10 => "十", 10 ** 1 => "百", 10 ** 3 => "千", 10**4 => "万", 10 ** 8 => "億", 10 ** 12 => "兆", 10 ** 16 => "京", 10 ** 20 => "垓", 10 ** 24 => "𥝱", 10 ** 28 => "穣", 10 ** 32 => "溝", 10 ** 36 => "澗", 10 ** 40 => "正", 10 ** 44 => "載", 10 ** 48 => "極"}

  def unit_hash(number)
    return NUMS_HASH[10 ** 1] if number >= 10 ** 1 && number < 10 ** 2
    return NUMS_HASH[10 ** 2] if number >= 10 ** 2 && number < 10 ** 3
    return NUMS_HASH[10 ** 3] if number >= 10 ** 3 && number < 10 ** 4
    return NUMS_HASH[10 ** 4] if number >= 10 ** 4 && number < 10 ** 8
    return NUMS_HASH[10 ** 8] if number >= 10 ** 8 && number < 10 ** 12
    return NUMS_HASH[10 ** 12] if number >= 10 ** 12 && number < 10 ** 16
    return NUMS_HASH[10 ** 16] if number >= 10 ** 16 && number < 10 ** 20
    return NUMS_HASH[10 ** 20] if number >= 10 ** 20 && number < 10 ** 24
    return NUMS_HASH[10 ** 24] if number >= 10 ** 24 && number < 10 ** 28
    return NUMS_HASH[10 ** 28] if number >= 10 ** 28 && number < 10 ** 32
    return NUMS_HASH[10 ** 32] if number >= 10 ** 32 && number < 10 ** 36
    return NUMS_HASH[10 ** 36] if number >= 10 ** 36 && number < 10 ** 40
    return NUMS_HASH[10 ** 40] if number >= 10 ** 40 && number < 10 ** 44
    return NUMS_HASH[10 ** 44] if number >= 10 ** 44 && number < 10 ** 48
    return NUMS_HASH[10 ** 48] if number >= 10 ** 48 && number < 10 ** 52
  end

  def group
    result = []
    inputs = self
    arr_input = self.to_s.split('')
    arr_input.each_with_index do |val, index|
      result << NUMS_HASH[val.to_i] if val.to_i!= 1
      result << unit_hash(inputs) if val.to_i!= 1
      result << unit_hash(inputs) if val.to_i== 1
      result << NUMS_HASH[val.to_i] if  val.to_i == 1 && index == arr_input.size - 1
      inputs = inputs/10
    end
    string = result.join("")
    return string
  end

def to_kansuji
  new_input_array = self.to_s.reverse.split('').each_slice(4)

  rs = []
  reverse_array = new_input_array.reverse_each
  puts arr_size = reverse_array.size
  puts reverse_array
  reverse_array.each do | arrays |
    number = arrays.reverse.join().to_i
    rs << number.group
    case arr_size
    when 2
      rs << "万"
    when 3
      rs << "億"
    when 4
      rs << "兆"
    when 5
      rs << "京"
    when 6
      rs << "垓"
    when 7
      rs << "𥝱"
    when 8
      rs << "穣"
    when 9
      rs << "溝"
    when 10
      rs << "澗"
    end
    arr_size -= 1
  end
  puts rs.join
end
  # # #
end

input = gets.chomp
puts input.to_s.to_i.to_kansuji
# x = 10 ** input.to_i
# puts x
