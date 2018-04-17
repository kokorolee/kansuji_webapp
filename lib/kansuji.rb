NUMS_HASH = { 0 => "零", 1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九"}
UNIT_HASH = { 10 ** 1 => "十", 10 ** 2 => "百", 10 ** 3 => "千"}
EXP_HASH = { 10 ** (4)  => '万', 10 ** (4*2) => "億", 10 ** (4*3) => "兆" , 10 ** (4*4) => "京", 10 ** (4*5) => "垓", 10 ** (4*6) => "𥝱", 10 ** (4*7) => "穣", 10 ** (4*8) => "溝", 10 ** (4*9) => "澗", 10 ** (4*10) => "正", 10 ** (4*11) => "載", 10 ** (4*12) => "極", 10 ** (4*13) => "恒河沙", 10 ** (4*14) => "阿僧祇", 10 ** (4*15) => "那由他", 10 ** (4*16) => "不可思議", 10 ** (4*17) => "無量大数" }

class Numeric
  def to_kansuji(rs = [])
    return rs.join << NUMS_HASH[0] unless self != 0
    reverse_array = self.to_s.reverse.split('').each_slice(4).reverse_each
    arr_size = reverse_array.size
    return rs.join if reverse_array.each do | val |
      (val.reverse.join().to_i == 0) ? (next arr_size -= 1) : rs << val.reverse.join().to_i.group_f_to
      rs << EXP_HASH[10 ** (4 * (arr_size - 1))] if val.reverse.join() != 0
      arr_size -= 1
    end
  end

  def group_f_to (arr_input = self.to_s.split(''), curr = '')
    begin
      next if arr_input[0].to_i == 0
      return curr += NUMS_HASH[arr_input[0].to_i].to_s if arr_input.length==1
      next curr += UNIT_HASH[10**(arr_input.length-1)].to_s if arr_input[0].to_i == 1 && arr_input[1] != 0
      curr += (NUMS_HASH[arr_input[0].to_i] + UNIT_HASH[10**(arr_input.length-1)]).to_s
    end while arr_input.slice!(0)
    return curr
  end
end

class String
  def to_number(result = 0, temp2 = [])
    result = 0 if self == "零"
    EXP_HASH.each { |key, val|  self.sub!(val,'\&,') }
    temp1 = self.split(",")    #print "\n temp1"    print temp1    print "\n"
    temp1.each do |num|
      temp2 << num.split(",") if EXP_HASH.each{ |key, val| num.sub!(val,',\&')}
    end    #print "\n temp2"    print temp2    print "\n"
    return result if temp2.each do |num|
      ac_num = 0
      kan2num = 1
      kan2num = EXP_HASH.key(num[1]) unless num[1] == nil
      UNIT_HASH.each { |key, val| num[0].sub!(val,'\&,') }
      temp3 = num[0].split(",")      #print "\n temp3"      print temp3      print "\n"
      result += ac_num * kan2num if temp3.each do |n|
          next ac_num += (NUMS_HASH.key(n[0]).to_i) * (UNIT_HASH.key(n[1])) if (!n[1].nil?)
          ac_num += NUMS_HASH.key(n[0]).to_i  + UNIT_HASH.key(n[0]).to_i
      end
    end
  end
end
