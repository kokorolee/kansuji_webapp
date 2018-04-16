require 'pry'
class String
  NUMS_HASH = {0 => "零", 1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九", 10 ** 1=> "十", 10 ** 2 => "百", 10 ** 3 => "千", 10 ** (4*2)  => '万', 10 ** (4*3) => "億", 10 ** (4*4) => "兆" , 10 ** (4*5) => "京", 10 ** (4*6) => "垓", 10 ** (4*7) => "𥝱", 10 ** (4*8) => "穣", 10 ** (4*9) => "溝", 10 ** (4*10) => "澗", 10 ** (4*11) => "正", 10 ** (4*12) => "載", 10 ** (4*13) => "極", 10 ** (4*14) => "恒河沙", 10 ** (4*15) => "阿僧祇", 10 ** (4*16) => "那由他", 10 ** (4*17) => "不可思議"}
  def unit_hash(number)    # binding.pry    # return NUMS_HASH[10 ** (number.to_s.length - 1) ] if number >= 10 ** (number.to_s.length - 1) && number < 10 ** number.to_s.length
    return NUMS_HASH[10 ** 1] if number >= 10 ** 1 && number < 10 ** 2
    return NUMS_HASH[10 ** 2] if number >= 10 ** 2 && number < 10 ** 3
    return NUMS_HASH[10 ** 3] if number >= 10 ** 3 && number < 10 ** 4
    return NUMS_HASH[10 ** (4*2)] if number >= 10 ** 4 && number < 10 ** (4*2)
  end
  def group_f
    result = []
    inputs = self.to_i
    arr_input = inputs.to_s.split('')
    return result.join("") if arr_input.each_with_index do |val, index| # puts val
      next inputs = inputs/10 if val.to_i == 0
      result << NUMS_HASH[val.to_i] << unit_hash(inputs) if val.to_i != 1
      result << unit_hash(inputs) if val.to_i == 1
      result << NUMS_HASH[val.to_i] if val.to_i == 1 && index == arr_input.size - 1
      inputs = inputs/10 # puts inputs # binding.pry
    end
  end
  def to_kansuji
    rs = []
    return rs.join << NUMS_HASH[0] unless self.to_i != 0
    reverse_array = self.to_s.reverse.split('').each_slice(4).reverse_each
    arr_size = reverse_array.size         # print 'arr_size: ' + arr_size.to_s + "\n"
    return rs.join if reverse_array.each_with_index do | val, index |      # print val      # print "\n"
      next arr_size -= 1 if val.reverse.join().to_i == 0
      rs << val.reverse.join().group_f      # puts 10 ** 4 * arr_size
      rs << NUMS_HASH[10 ** (4 * arr_size)] unless val.reverse.join() == 0
      arr_size -= 1      # puts index      # puts reverse_array.size
    end # puts string = rs.join
  end
