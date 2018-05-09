class String
  def to_number
    power_1_to_3 = %w(十 百 千).unshift('')
    power_4_to_68 = %w(万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 恒 阿 那 不 無).unshift('')
    kanji_number = %w(零 一 二 三 四 五 六 七 八 九)
    a = b = sum = 0
    self.each_char.with_index do |c, i|
      power_4 = power_4_to_68.include?(c) ? 10**(power_4_to_68.index(c)*4) : 0
      power_1 = power_1_to_3.include?(c) ? 10**power_1_to_3.index(c) : 0
      sum += (b + a) * power_4
      a == 0 ? b += power_1 : b += a * power_1
      b = 0 if power_4 != 0
      a = kanji_number.index(c).to_i
      sum += (b + a) if (i == self.size - 1)
    end
    sum
  end
end

class Integer
  def to_kansuji
    return '零' if self == 0
    b = d = ''
    power_1_to_3 = %w(十 百 千).unshift('')
    power_4_to_68 = %w(万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 沙河恒 祇僧阿 他由那 議思可不 数大量無).unshift('')
    kanji_number = %w(零 一 二 三 四 五 六 七 八 九)
    self.to_s.reverse.scan(/.{1,4}/).each_with_index do |n, i|
      n.split('').each_with_index do |c, index|
        b += '一' if index == 0 && c == '1'
        b += power_1_to_3[index] if c != '0'
        b += kanji_number[c.to_i] if c != '0' && c != '1'
      end
      d.concat(n.to_i != 0 ? b.prepend(power_4_to_68[i]) : b)
      b = ''
    end
    d.reverse
  end
end

# '百二十九澗四百二十四溝五千百二十四穣千百十𥝱一垓四千五百十四京千十兆千四百九億千五百九万三千五百四十八'.to_number
# '九十一載二千四百三十正千一澗百溝四千八百十穣四千三百九十八𥝱五百一垓九千八百五十京九千百七十五兆三千三百九億千二百七十八万四千三百九'.to_number
# '九不可思議八千七百二十三那由他九千八百六十七阿僧祇九千八百三十四恒河沙七千六百十八極五千九十二載千百正九千三百五澗九千八百二十一溝五百七十二穣千四百九十𥝱五千八百三十垓二千九百四十八京百二十四兆七千八百二十億三千四百七十三万二千九十八'.to_number
# '九無量大数八千七百二十三不可思議九千八百六十七那由他九千八百三十四阿僧祇七千六百十八恒河沙五千九十二極千百載九千三百五正九千八百二十一澗五百七十二溝千四百九十穣五千八百三十𥝱二千九百四十八垓百二十四京七千八百二十兆三千四百七十三億二千九十八万百九十'.to_number
# # '二十三万四百五十六'.to_number
# # '二溝三千四百九穣八千七百六十五𥝱七千八百九垓八千五百四十三京四千二百三十四兆三千百二十四億三千五百四十六万五千七百八十九'.to_number
# # '十溝四千三垓二十京三百三十億一万千百十'.to_number
# # 0.to_kanji
# # 1.to_kanji
# # 10.to_kanji
# 0.to_kanji
# 1.to_kanji
# 11.to_kanji
# # 12.to_kanji
# 230456.to_kanji
# 234098765780985434234312435465789.to_kanji
# 1000000000400300200000033000011110.to_kanji
# 129054456640000677212852291370052008738.to_kanji
# 987239867983476185092110093059821057214905830294801247820347320980190.to_kanji
