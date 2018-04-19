$numbers = ['', '一', '二','三', '四', '五','六', '七','八','九','十'].insert(100, '百').insert(1000, '千')
$quartets = ["", "万","億","兆","京", "垓","𥝱","穣","溝","澗","正","載","極","恒河沙", "阿僧祇", "那由他", "不可思議", "無量大数" ]
$qua = { "万" => 10**4, "億" => 10**8, "兆" => 10**12, "京" => 10**16, "垓" => 10**20, "𥝱" => 10**24, "穣" => 10**28, "溝" => 10**32, "澗" => 10**36, "正" => 10**40, "載" => 10**44, "極" => 10**48, "恒河沙" => 10**52, "阿僧祇" => 10**56, "那由他" => 10**60, "不可思議" => 10**64, "無量大数" => 10**68 }

class Integer
  def to_kansuji
    result_array = []
    result = ""
    return result = "零" if (self == "" || self == 0)
    self.to_s.reverse.split("").each_slice(4).each_with_index do |t,k|
      v = t.reverse.join("").to_s
      next if ( v.to_i == 0)
      temp_result = $numbers[v[-1, 1].to_i]
      temp_result = $numbers[10] + temp_result if ( v[-2, 1].to_i == 1 )
      temp_result = $numbers[v[-2, 1].to_i] + $numbers[10] + temp_result if
        ( v[-2, 1].to_i != 0 && v[-2, 1].to_i != 1)
      temp_result = $numbers[100] + temp_result if ( v[-3, 1].to_i == 1 )
      temp_result = $numbers[v[-3, 1].to_i] + $numbers[100] + temp_result  if
        ( v[-3, 1].to_i != 0 && v[-3, 1].to_i != 1)
      temp_result = $numbers[1000] + temp_result if ( v[-4, 1].to_i == 1 )
      temp_result = $numbers[v[-4, 1].to_i] + $numbers[1000] + temp_result if
        ( v[-4, 1].to_i != 0 && v[-4, 1].to_i != 1)
      result = temp_result + $quartets[k] + result
    end
    return result
  end
end

class String
  def to_number
    parse =  self.split(/(一|二|三|四|五|六|七|八|九|十|百|千|万|億|兆|京|垓
      |𥝱|穣|溝|澗|正|載|極|恒河沙|阿僧祇|那由他|不可思議|無量大数)/).delete_if { |i| i == "" }
    temp2 = result = rsplus = 0
    temp = 1
    return result.to_i + temp2.to_i + rsplus.to_i if parse.each_with_index do |val, i |
      if ( $numbers.index(parse[i]) && $numbers.index(parse[i]) < 10 )
        temp2 = temp = $numbers.index(parse[i])
      elsif (  $numbers.index(parse[i]) )
        rsplus += temp * $numbers.index(parse[i])
        temp = 1
        temp2 = 0
      else
        result = result.to_i + ((rsplus.to_i + temp2) * $qua[parse[i]].to_i)
        temp2 = rsplus = 0
        temp = 1
      end
    end
  end
end
