require 'pry'
NUMS_HASH = { 0 => "零", 1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九"}
UNIT_HASH = { 10 ** 1 => "十", 10 ** 2 => "百", 10 ** 3 => "千"}
EXP_HASH = { 10 ** (4*2)  => '万', 10 ** (4*3) => "億", 10 ** (4*4) => "兆" , 10 ** (4*5) => "京", 10 ** (4*6) => "垓", 10 ** (4*7) => "𥝱", 10 ** (4*8) => "穣", 10 ** (4*9) => "溝", 10 ** (4*10) => "澗", 10 ** (4*11) => "正", 10 ** (4*12) => "載", 10 ** (4*13) => "極", 10 ** (4*14) => "恒河沙", 10 ** (4*15) => "阿僧祇", 10 ** (4*16) => "那由他", 10 ** (4*17) => "不可思議", 10 ** (4*18) => "無量大数" }
EXP_ARR = ["万","億","兆","京","垓","𥝱","穣","溝","澗","正","載","極","恒河沙","阿僧祇","那由他","不可思議","無量大数"]
class Numeric
  def unit_hash(number)
    return UNIT_HASH[10 ** 1] if number >= 10 ** 1 && number < 10 ** 2
    return UNIT_HASH[10 ** 2] if number >= 10 ** 2 && number < 10 ** 3
    return UNIT_HASH[10 ** 3] if number >= 10 ** 3 && number < 10 ** 4
    return UNIT_HASH[10 ** (4*2)] if number >= 10 ** 4 && number < 10 ** (4*2)
  end
  def to_kansuji(rs = [])
    return rs.join << NUMS_HASH[0] unless self != 0
    reverse_array = self.to_s.reverse.split('').each_slice(4).reverse_each
    arr_size = reverse_array.size
    return rs.join if reverse_array.each do | val |
      (val.reverse.join().to_i == 0) ? (next arr_size -= 1) : rs << val.reverse.join().to_i.group_f
      rs << EXP_HASH[10 ** (4 * arr_size)] if val.reverse.join() != 0
      arr_size -= 1
    end
  end
  def group_f (rs = [], inputs = self, arr_input = inputs.to_s.split(''))
    return rs.join("") if arr_input.each_with_index do |val, index|
      (val.to_i == 0) ? (next inputs = inputs/10) : (val.to_i != 1) ? (rs << NUMS_HASH[val.to_i] << unit_hash(inputs)) : (val.to_i == 1 && index == arr_input.size - 1) ? rs << NUMS_HASH[val.to_i] : (rs << unit_hash(inputs))
      inputs = inputs/10
    end
  end
end
class String
  def to_number(result = 0)
    if self == "零"
      result = 0
    else
      EXP_HASH.each do |key, val|
        self.sub!(val,'\&,')
      end
      temp1 = self.split(",")
      temp2 = []
      temp1.each do |num|
        EXP_HASH.each do |key, val|
          num.sub!(val,',\&')
        end
        temp2 << num.split(",")
      end
      temp2.each do |num|
        ac_num = 0
        kan2num = 1
        unless num[1] == nil
          kan2num = 10 ** ((EXP_ARR.find_index(num[1]) + 1) * 4)
        end
        # binding.pry
        UNIT_HASH.each do |key, val|
          num[0].sub!(val,'\&,')
        end
        temp3 = num[0].split(",")
        temp3.each do |n|
          unless n[1] == nil
            ac_num += (NUMS_HASH.key(n[0]).to_i) * (UNIT_HASH.key(n[1]))
          else
            if !NUMS_HASH.key(n[0]).nil?
              ac_num += NUMS_HASH.key(n[0]).to_i
            else
              ac_num += UNIT_HASH.key(n[0])
            end
          end
        end
        result += ac_num * kan2num
      end
    end
    result
  end
end

  # input = gets.chomp
  input = '五万千四百七十一'
  puts input.to_number
  # puts input.to_i.to_kansuji
  # puts unit_hash(100)
  # number = inputs >= 10 ** 4 && inputs < 10 ** (4*2) ? 8 : inputs >= 10 ** 3 && inputs < 10 ** 4 ? 3 : inputs >= 10 ** 1 && inputs < 10 ** 2 ? 2 : 1
