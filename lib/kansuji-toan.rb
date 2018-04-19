$numbers = ['', '一', '二','三', '四', '五','六', '七','八','九','十'].insert(100, '百').insert(1000, '千')
$quartets = ["", "万","億","兆","京", "垓","𥝱","穣","溝","澗","正","載","極","恒河沙", "阿僧祇", "那由他", "不可思議", "無量大数" ]
$qua = { "万" => 10**4, "億" => 10**8, "兆" => 10**12, "京" => 10**16, "垓" => 10**20, "𥝱" => 10**24, "穣" => 10**28, "溝" => 10**32, "澗" => 10**36, "正" => 10**40, "載" => 10**44, "極" => 10**48, "恒河沙" => 10**52, "阿僧祇" => 10**56, "那由他" => 10**60, "不可思議" => 10**64, "無量大数" => 10**68 }
class Integer
  def to_kansuji
    result_array = []
    result = ""
    i = 4
    kq = "0"*(((self.to_s.size / 4.to_f).ceil * 4) - self.to_s.size) + self.to_s
    while i <= kq.to_s.size do
      result_array << kq[i * -1, 4]
      i += 4
    end
    result_array.each_with_index do |v,k|
      next if ( (v.to_s).to_i == 0)
      temp_result = $numbers[v[-1, 1].to_i]
      if ( v[-2, 1].to_i == 1.to_i )
        temp_result = $numbers[10] + temp_result
      elsif ( v[-2, 1].to_i != 0.to_i )
        temp_result = $numbers[v[-2, 1].to_i].to_s + $numbers[10].to_s + temp_result.to_s
      end # end == 2
      if ( v[-3, 1].to_i == 1.to_i )
        temp_result = $numbers[100] + temp_result
      elsif ( v[-3, 1].to_i != 0.to_i )
        temp_result = $numbers[v[-3, 1].to_i].to_s + $numbers[100].to_s + temp_result.to_s
      end # end 3
      if ( v[-4, 1].to_i == 1.to_i )
        temp_result = $numbers[1000] + temp_result
      elsif ( v[-4, 1].to_i != 0.to_i )
        temp_result = $numbers[v[-4, 1].to_i].to_s + $numbers[1000].to_s + temp_result.to_s
      end # end 4
      result = temp_result + $quartets[k] + result
    end # end each
    result = "零" if (result == "")
    return result
  end # end def to_kansuji
end # end class
class String
  def to_number
    parse =  self.split(/(一|二|三|四|五|六|七|八|九|十|百|千|万|億|兆|京|垓|𥝱|穣|溝|澗|正|載|極|恒河沙|阿僧祇|那由他|不可思議|無量大数)/).delete_if{|i| i == ""}
    rsplus = 0
    temp = 1
    temp2 = 0
    result = 0
    parse.each_with_index do |val, i |
      if ( $numbers.index(parse[i]) && $numbers.index(parse[i]) < 10 )
        temp = $numbers.index(parse[i])
        temp2 = temp
      elsif (  $numbers.index(parse[i]) )
        rsplus += temp * $numbers.index(parse[i])
        temp = 1
        temp2 = 0
      else
        result = result.to_i + ((rsplus.to_i + temp2) * $qua[parse[i]].to_i)
        rsplus = 0
        temp = 1
        temp2 = 0
      end
    end
    return result.to_i + temp2.to_i + rsplus.to_i
  end
end
